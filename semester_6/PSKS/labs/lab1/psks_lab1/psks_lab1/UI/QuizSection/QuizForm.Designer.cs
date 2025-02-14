namespace psks_lab1.UI.QuizSection
{
    partial class QuizForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(QuizForm));
            this.MainSplitContainer = new System.Windows.Forms.SplitContainer();
            this.QuestionLabel = new System.Windows.Forms.Label();
            this.QuestionNumberLabel = new System.Windows.Forms.Label();
            this.FalseRadioButton = new System.Windows.Forms.RadioButton();
            this.TrueRadioButton = new System.Windows.Forms.RadioButton();
            this.NextButton = new System.Windows.Forms.Button();
            this.FinishButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.MainSplitContainer)).BeginInit();
            this.MainSplitContainer.Panel1.SuspendLayout();
            this.MainSplitContainer.Panel2.SuspendLayout();
            this.MainSplitContainer.SuspendLayout();
            this.SuspendLayout();
            // 
            // MainSplitContainer
            // 
            this.MainSplitContainer.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.MainSplitContainer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.MainSplitContainer.IsSplitterFixed = true;
            this.MainSplitContainer.Location = new System.Drawing.Point(0, 0);
            this.MainSplitContainer.Name = "MainSplitContainer";
            this.MainSplitContainer.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // MainSplitContainer.Panel1
            // 
            this.MainSplitContainer.Panel1.Controls.Add(this.QuestionLabel);
            this.MainSplitContainer.Panel1.Controls.Add(this.QuestionNumberLabel);
            // 
            // MainSplitContainer.Panel2
            // 
            this.MainSplitContainer.Panel2.Controls.Add(this.FalseRadioButton);
            this.MainSplitContainer.Panel2.Controls.Add(this.TrueRadioButton);
            this.MainSplitContainer.Panel2.Controls.Add(this.NextButton);
            this.MainSplitContainer.Panel2.Controls.Add(this.FinishButton);
            this.MainSplitContainer.Size = new System.Drawing.Size(389, 395);
            this.MainSplitContainer.SplitterDistance = 320;
            this.MainSplitContainer.TabIndex = 0;
            // 
            // QuestionLabel
            // 
            this.QuestionLabel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.QuestionLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.QuestionLabel.Location = new System.Drawing.Point(0, 34);
            this.QuestionLabel.Name = "QuestionLabel";
            this.QuestionLabel.Size = new System.Drawing.Size(387, 284);
            this.QuestionLabel.TabIndex = 1;
            this.QuestionLabel.Text = resources.GetString("QuestionLabel.Text");
            this.QuestionLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // QuestionNumberLabel
            // 
            this.QuestionNumberLabel.BackColor = System.Drawing.SystemColors.Control;
            this.QuestionNumberLabel.Dock = System.Windows.Forms.DockStyle.Top;
            this.QuestionNumberLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.QuestionNumberLabel.Location = new System.Drawing.Point(0, 0);
            this.QuestionNumberLabel.Name = "QuestionNumberLabel";
            this.QuestionNumberLabel.Size = new System.Drawing.Size(387, 34);
            this.QuestionNumberLabel.TabIndex = 0;
            this.QuestionNumberLabel.Text = "QuestionNumberLabel";
            this.QuestionNumberLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // FalseRadioButton
            // 
            this.FalseRadioButton.AutoSize = true;
            this.FalseRadioButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.FalseRadioButton.Location = new System.Drawing.Point(206, 24);
            this.FalseRadioButton.Name = "FalseRadioButton";
            this.FalseRadioButton.Size = new System.Drawing.Size(44, 21);
            this.FalseRadioButton.TabIndex = 3;
            this.FalseRadioButton.Text = "No";
            this.FalseRadioButton.UseVisualStyleBackColor = true;
            // 
            // TrueRadioButton
            // 
            this.TrueRadioButton.AutoSize = true;
            this.TrueRadioButton.Checked = true;
            this.TrueRadioButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.TrueRadioButton.Location = new System.Drawing.Point(135, 24);
            this.TrueRadioButton.Name = "TrueRadioButton";
            this.TrueRadioButton.Size = new System.Drawing.Size(50, 21);
            this.TrueRadioButton.TabIndex = 2;
            this.TrueRadioButton.TabStop = true;
            this.TrueRadioButton.Text = "Yes";
            this.TrueRadioButton.UseVisualStyleBackColor = true;
            // 
            // NextButton
            // 
            this.NextButton.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.NextButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.NextButton.Location = new System.Drawing.Point(286, 15);
            this.NextButton.Name = "NextButton";
            this.NextButton.Size = new System.Drawing.Size(90, 39);
            this.NextButton.TabIndex = 1;
            this.NextButton.Text = "Next";
            this.NextButton.UseVisualStyleBackColor = true;
            this.NextButton.Click += new System.EventHandler(this.NextButton_Click);
            // 
            // FinishButton
            // 
            this.FinishButton.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.FinishButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.FinishButton.Location = new System.Drawing.Point(11, 15);
            this.FinishButton.Name = "FinishButton";
            this.FinishButton.Size = new System.Drawing.Size(90, 39);
            this.FinishButton.TabIndex = 0;
            this.FinishButton.Text = "Finish";
            this.FinishButton.UseVisualStyleBackColor = true;
            this.FinishButton.Click += new System.EventHandler(this.FinishButton_Click);
            // 
            // QuizForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(389, 395);
            this.Controls.Add(this.MainSplitContainer);
            this.Name = "QuizForm";
            this.Text = "QuizForm";
            this.MainSplitContainer.Panel1.ResumeLayout(false);
            this.MainSplitContainer.Panel2.ResumeLayout(false);
            this.MainSplitContainer.Panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.MainSplitContainer)).EndInit();
            this.MainSplitContainer.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer MainSplitContainer;
        private System.Windows.Forms.Label QuestionLabel;
        private System.Windows.Forms.Label QuestionNumberLabel;
        private System.Windows.Forms.Button NextButton;
        private System.Windows.Forms.Button FinishButton;
        private System.Windows.Forms.RadioButton FalseRadioButton;
        private System.Windows.Forms.RadioButton TrueRadioButton;
    }
}