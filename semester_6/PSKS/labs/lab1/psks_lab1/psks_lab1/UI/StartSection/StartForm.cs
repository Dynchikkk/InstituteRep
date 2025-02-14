using psks_lab1.UI.FillDataSection;
using psks_lab1.UI.QuizSection;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace psks_lab1.UI
{
    public partial class StartForm : Form
    {
        private Dictionary<string, List<string>> _statementsToObjects;

        private FillDataForm _fillDataForm;
        private QuizForm _quizForm;

        public StartForm()
        {
            InitializeComponent();

            _statementsToObjects = new Dictionary<string, List<string>>();
        }

        ~StartForm()
        {
            _fillDataForm?.Close();
            _quizForm?.Close();
        }

        private void PlayButton_Click(object sender, EventArgs e)
        {
            _quizForm = new QuizForm(_statementsToObjects);
            _quizForm.ShowDialog();
        }

        private void FillDataButton_Click(object sender, EventArgs e)
        {
            _fillDataForm = new FillDataForm();
            _fillDataForm.DataFilled += (filledData) =>
            {
                _statementsToObjects = filledData;
            };
            _fillDataForm.ShowDialog();
        }

        private void LoadData_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Text files (*.txt)|*.txt|All files (*.*)|*.*"
            };
            string filePath = openFileDialog.ShowDialog() == DialogResult.OK ? openFileDialog.FileName : null;
            if (string.IsNullOrEmpty(filePath))
            {
                return;
            }
            // Читаем файл построчно
            foreach (string line in File.ReadLines(filePath))
            {
                // Предполагается, что строка имеет формат "условие : объект, объект"
                string[] parts = line.Split(':');
                string statement = parts[0].Trim();
                List<string> objects = parts[1]
                    .Split(',')
                    .Select(obj => obj.Trim())
                    .ToList();

                _statementsToObjects.Add(statement, objects);
            }

        }
    }
}
