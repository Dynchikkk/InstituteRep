namespace psks_lab1.UI
{
    partial class StartForm
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
            this.FillDataButton = new System.Windows.Forms.Button();
            this.PlayButton = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // FillDataButton
            // 
            this.FillDataButton.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.FillDataButton.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.FillDataButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.FillDataButton.Location = new System.Drawing.Point(12, 12);
            this.FillDataButton.Name = "FillDataButton";
            this.FillDataButton.Size = new System.Drawing.Size(214, 101);
            this.FillDataButton.TabIndex = 0;
            this.FillDataButton.Text = "Fill Data";
            this.FillDataButton.UseVisualStyleBackColor = true;
            this.FillDataButton.Click += new System.EventHandler(this.FillDataButton_Click);
            // 
            // PlayButton
            // 
            this.PlayButton.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.PlayButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.PlayButton.Location = new System.Drawing.Point(232, 12);
            this.PlayButton.Name = "PlayButton";
            this.PlayButton.Size = new System.Drawing.Size(217, 101);
            this.PlayButton.TabIndex = 1;
            this.PlayButton.Text = "Play";
            this.PlayButton.UseVisualStyleBackColor = true;
            this.PlayButton.Click += new System.EventHandler(this.PlayButton_Click);
            // 
            // StartForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(460, 125);
            this.Controls.Add(this.PlayButton);
            this.Controls.Add(this.FillDataButton);
            this.MaximumSize = new System.Drawing.Size(476, 164);
            this.MinimumSize = new System.Drawing.Size(476, 164);
            this.Name = "StartForm";
            this.Text = "StartForm";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button FillDataButton;
        private System.Windows.Forms.Button PlayButton;
    }
}