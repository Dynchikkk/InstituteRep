using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace psks_lab1.UI.QuizSection
{
    public partial class QuizForm : Form
    {
        private const int DISPLAY_RESULT_COUNT = 3;

        private readonly Dictionary<string, List<string>> _statementsToObjects;
        private readonly List<string> _statements;
        private readonly Dictionary<string, int> _objectsFrequency;
        
        private int _currentStatementIndex = 0;

        public QuizForm(Dictionary<string, List<string>> statementsToObjects)
        {
            InitializeComponent();

            _objectsFrequency = new Dictionary<string, int>();
            _statementsToObjects = statementsToObjects;
            _statements = _statementsToObjects.Keys.ToList();
            foreach (List<string> objects in _statementsToObjects.Values)
            {
                foreach (string soloObject in objects) 
                {
                    if (_objectsFrequency.ContainsKey(soloObject))
                    {
                        continue;
                    }
                    _objectsFrequency.Add(soloObject, 0);
                }
            }

            UpdateQuestion();
        }

        private void UpdateQuestion()
        {
            if (_currentStatementIndex >= _statements.Count)
            {
                Finish();
                return;
            }
            QuestionNumberLabel.Text = $"Question {_currentStatementIndex + 1}";
            QuestionLabel.Text = $"{_statements[_currentStatementIndex]}?";
        }

        private void AnalizeQuestionAnswer(bool result)
        {
            if (!result)
            {
                return;
            }
            string currentStatement = _statements[_currentStatementIndex];
            foreach (string soloObject in _statementsToObjects[currentStatement])
            {
                _objectsFrequency[soloObject]++;
            }
        }

        private void Finish()
        {
            int displayCount = Math.Min(_objectsFrequency.Keys.Count, DISPLAY_RESULT_COUNT);
            List<string> topObjects = _objectsFrequency
                .OrderByDescending(x => x.Value)
                .Take(displayCount)
                .Select(x => x.Key)
                .ToList();

            StringBuilder topText = new StringBuilder();
            foreach (var soloObject in topObjects)
            {
                int persent = 0;//(_objectsFrequency[soloObject] / _ob.Count) * 100;
                topText.AppendLine($"{soloObject} - {persent}%");
            }

            QuestionNumberLabel.Text = "Result";
            QuestionLabel.Text = topText.ToString();
            NextButton.Enabled = false;
            FinishButton.Enabled = false;
        }

        private void NextButton_Click(object sender, EventArgs e)
        {
            AnalizeQuestionAnswer(TrueRadioButton.Checked);
            _currentStatementIndex++;
            UpdateQuestion();
        }
    }
}
