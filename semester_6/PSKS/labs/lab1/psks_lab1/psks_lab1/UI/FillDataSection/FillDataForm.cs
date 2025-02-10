using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;
using System.Xml.Linq;

namespace psks_lab1.UI.FillDataSection
{
    public partial class FillDataForm : Form
    {
        public event Action<Dictionary<string, List<string>>> DataFilled = delegate { };

        private readonly Dictionary<string, List<string>> _statementsToObjects;
        private readonly List<string> _statements;
        private readonly List<string> _objects;

        private string _lastDropDownObject;

        public FillDataForm()
        {
            InitializeComponent();

            _objects = new List<string>();
            _statements = new List<string>();
            _statementsToObjects = new Dictionary<string, List<string>>();
            
            foreach (var statementToObjects in _statementsToObjects)
            {
                _statements.Add(statementToObjects.Key);
                foreach (string soloObject in statementToObjects.Value)
                {
                    _objects.Add(soloObject);
                }
            }

            FillPanel.Visible = true;
            CheckedPanel.Visible = false;
        }

        public void SaveFilledData()
        {
            _objects.Clear();
            foreach (DataGridViewRow row in ObjectDataGridView.Rows)
            {
                string soloObject = row.Cells[0].Value?.ToString();
                if (string.IsNullOrEmpty(soloObject))
                {
                    continue;
                }
                _objects.Add(soloObject);
            }
            _statements.Clear();
            foreach (DataGridViewRow row in StatementDataGridView.Rows)
            {
                string statement = row.Cells[0].Value?.ToString();
                if (string.IsNullOrEmpty(statement))
                {
                    continue;
                }
                _statements.Add(statement);
                _statementsToObjects.Add(statement, new List<string>());
            }
        }

        public void SaveCheckBoxesValue()
        {
            if (!CheckedPanel.Visible)
            {
                return;
            }

            for (int i = 0; i < StatementsCheckList.Items.Count; i++)
            {
                bool isChecked = StatementsCheckList.GetItemChecked(i);
                string statement = StatementsCheckList.Items[i].ToString();
                if (isChecked)
                {
                    if(_statementsToObjects[statement].Contains(_lastDropDownObject))
                    {
                        continue;
                    }
                    _statementsToObjects[statement].Add(_lastDropDownObject);
                }
                else
                {
                    _statementsToObjects[statement].Remove(_lastDropDownObject);
                }
            }
        }

        private void ContinueButton_Click(object sender, EventArgs e)
        {
            SaveFilledData();

            ObjectsDropDown.Items.AddRange(_objects.ToArray());
            ObjectsDropDown.Text = _objects[0];
            _lastDropDownObject = _objects[0];
            StatementsCheckList.Items.Clear();
            StatementsCheckList.Items.AddRange(_statements.ToArray());

            FillPanel.Visible = false;
            CheckedPanel.Visible = true;
        }

        private void ObjectsDropDown_TextChanged(object sender, EventArgs e)
        {
            SaveCheckBoxesValue();
            _lastDropDownObject = ObjectsDropDown.Text;
        }

        private void FinishButton_Click(object sender, EventArgs e)
        {
            DataFilled?.Invoke(_statementsToObjects);
            Close();
        }
    }
}
