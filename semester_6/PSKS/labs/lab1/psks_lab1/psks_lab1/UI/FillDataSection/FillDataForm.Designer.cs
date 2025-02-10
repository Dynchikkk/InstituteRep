namespace psks_lab1.UI.FillDataSection
{
    partial class FillDataForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            this.ObjectDataGridView = new System.Windows.Forms.DataGridView();
            this.ObjectColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.StatementDataGridView = new System.Windows.Forms.DataGridView();
            this.ContinueButton = new System.Windows.Forms.Button();
            this.FillPanel = new System.Windows.Forms.Panel();
            this.StatementColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CheckedPanel = new System.Windows.Forms.Panel();
            this.ObjectsDropDown = new System.Windows.Forms.ComboBox();
            this.ObjectLabel = new System.Windows.Forms.Label();
            this.StatementsCheckList = new System.Windows.Forms.CheckedListBox();
            this.FinishButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.ObjectDataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.StatementDataGridView)).BeginInit();
            this.FillPanel.SuspendLayout();
            this.CheckedPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // ObjectDataGridView
            // 
            this.ObjectDataGridView.AllowUserToResizeColumns = false;
            this.ObjectDataGridView.AllowUserToResizeRows = false;
            this.ObjectDataGridView.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle7.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle7.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            dataGridViewCellStyle7.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle7.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle7.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle7.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.ObjectDataGridView.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle7;
            this.ObjectDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ObjectDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ObjectColumn});
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle8.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle8.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            dataGridViewCellStyle8.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle8.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle8.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle8.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.ObjectDataGridView.DefaultCellStyle = dataGridViewCellStyle8;
            this.ObjectDataGridView.Location = new System.Drawing.Point(12, 12);
            this.ObjectDataGridView.Name = "ObjectDataGridView";
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle9.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle9.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            dataGridViewCellStyle9.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle9.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle9.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle9.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.ObjectDataGridView.RowHeadersDefaultCellStyle = dataGridViewCellStyle9;
            this.ObjectDataGridView.RowTemplate.DefaultCellStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.ObjectDataGridView.Size = new System.Drawing.Size(776, 190);
            this.ObjectDataGridView.TabIndex = 0;
            // 
            // ObjectColumn
            // 
            this.ObjectColumn.HeaderText = "Object";
            this.ObjectColumn.MaxInputLength = 128;
            this.ObjectColumn.Name = "ObjectColumn";
            this.ObjectColumn.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            // 
            // StatementDataGridView
            // 
            this.StatementDataGridView.AllowUserToResizeColumns = false;
            this.StatementDataGridView.AllowUserToResizeRows = false;
            this.StatementDataGridView.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle10.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle10.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            dataGridViewCellStyle10.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle10.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle10.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle10.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.StatementDataGridView.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle10;
            this.StatementDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.StatementDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.StatementColumn});
            dataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle11.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle11.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            dataGridViewCellStyle11.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle11.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle11.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle11.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.StatementDataGridView.DefaultCellStyle = dataGridViewCellStyle11;
            this.StatementDataGridView.Location = new System.Drawing.Point(12, 208);
            this.StatementDataGridView.Name = "StatementDataGridView";
            dataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle12.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle12.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            dataGridViewCellStyle12.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle12.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle12.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle12.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.StatementDataGridView.RowHeadersDefaultCellStyle = dataGridViewCellStyle12;
            this.StatementDataGridView.RowTemplate.DefaultCellStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.StatementDataGridView.RowTemplate.Height = 25;
            this.StatementDataGridView.Size = new System.Drawing.Size(776, 190);
            this.StatementDataGridView.TabIndex = 1;
            // 
            // ContinueButton
            // 
            this.ContinueButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.ContinueButton.Location = new System.Drawing.Point(680, 404);
            this.ContinueButton.Name = "ContinueButton";
            this.ContinueButton.Size = new System.Drawing.Size(108, 34);
            this.ContinueButton.TabIndex = 2;
            this.ContinueButton.Text = "Continue";
            this.ContinueButton.UseVisualStyleBackColor = true;
            this.ContinueButton.Click += new System.EventHandler(this.ContinueButton_Click);
            // 
            // FillPanel
            // 
            this.FillPanel.Controls.Add(this.ObjectDataGridView);
            this.FillPanel.Controls.Add(this.ContinueButton);
            this.FillPanel.Controls.Add(this.StatementDataGridView);
            this.FillPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.FillPanel.Location = new System.Drawing.Point(0, 0);
            this.FillPanel.Name = "FillPanel";
            this.FillPanel.Size = new System.Drawing.Size(800, 450);
            this.FillPanel.TabIndex = 3;
            // 
            // StatementColumn
            // 
            this.StatementColumn.HeaderText = "Statement";
            this.StatementColumn.Name = "StatementColumn";
            this.StatementColumn.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            // 
            // CheckedPanel
            // 
            this.CheckedPanel.Controls.Add(this.FinishButton);
            this.CheckedPanel.Controls.Add(this.StatementsCheckList);
            this.CheckedPanel.Controls.Add(this.ObjectLabel);
            this.CheckedPanel.Controls.Add(this.ObjectsDropDown);
            this.CheckedPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.CheckedPanel.Location = new System.Drawing.Point(0, 0);
            this.CheckedPanel.Name = "CheckedPanel";
            this.CheckedPanel.Size = new System.Drawing.Size(800, 450);
            this.CheckedPanel.TabIndex = 3;
            // 
            // ObjectsDropDown
            // 
            this.ObjectsDropDown.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.ObjectsDropDown.FormattingEnabled = true;
            this.ObjectsDropDown.Location = new System.Drawing.Point(73, 12);
            this.ObjectsDropDown.Name = "ObjectsDropDown";
            this.ObjectsDropDown.Size = new System.Drawing.Size(189, 24);
            this.ObjectsDropDown.TabIndex = 0;
            this.ObjectsDropDown.TextChanged += new System.EventHandler(this.ObjectsDropDown_TextChanged);
            // 
            // ObjectLabel
            // 
            this.ObjectLabel.AutoSize = true;
            this.ObjectLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.ObjectLabel.Location = new System.Drawing.Point(12, 12);
            this.ObjectLabel.Name = "ObjectLabel";
            this.ObjectLabel.Size = new System.Drawing.Size(55, 20);
            this.ObjectLabel.TabIndex = 1;
            this.ObjectLabel.Text = "Object";
            // 
            // StatementsCheckList
            // 
            this.StatementsCheckList.CheckOnClick = true;
            this.StatementsCheckList.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.StatementsCheckList.FormattingEnabled = true;
            this.StatementsCheckList.Items.AddRange(new object[] {
            "a",
            "b",
            "c",
            "d"});
            this.StatementsCheckList.Location = new System.Drawing.Point(16, 53);
            this.StatementsCheckList.Name = "StatementsCheckList";
            this.StatementsCheckList.Size = new System.Drawing.Size(772, 346);
            this.StatementsCheckList.TabIndex = 2;
            // 
            // FinishButton
            // 
            this.FinishButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.FinishButton.Location = new System.Drawing.Point(680, 405);
            this.FinishButton.Name = "FinishButton";
            this.FinishButton.Size = new System.Drawing.Size(108, 34);
            this.FinishButton.TabIndex = 3;
            this.FinishButton.Text = "Finish";
            this.FinishButton.UseVisualStyleBackColor = true;
            this.FinishButton.Click += new System.EventHandler(this.FinishButton_Click);
            // 
            // FillDataForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.CheckedPanel);
            this.Controls.Add(this.FillPanel);
            this.Name = "FillDataForm";
            this.Text = "FillDataForm";
            ((System.ComponentModel.ISupportInitialize)(this.ObjectDataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.StatementDataGridView)).EndInit();
            this.FillPanel.ResumeLayout(false);
            this.CheckedPanel.ResumeLayout(false);
            this.CheckedPanel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView ObjectDataGridView;
        private System.Windows.Forms.DataGridViewTextBoxColumn ObjectColumn;
        private System.Windows.Forms.DataGridView StatementDataGridView;
        private System.Windows.Forms.Button ContinueButton;
        private System.Windows.Forms.DataGridViewTextBoxColumn StatementColumn;
        private System.Windows.Forms.Panel FillPanel;
        private System.Windows.Forms.Panel CheckedPanel;
        private System.Windows.Forms.Button FinishButton;
        private System.Windows.Forms.CheckedListBox StatementsCheckList;
        private System.Windows.Forms.Label ObjectLabel;
        private System.Windows.Forms.ComboBox ObjectsDropDown;
    }
}