namespace examination_system
{
    partial class ExamLayout
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ExamLayout));
            ExamNameLabel = new Label();
            QuestionLabel = new Label();
            SubmitButton = new Button();
            Ans1RB = new RadioButton();
            Ans2RB = new RadioButton();
            Ans3RB = new RadioButton();
            Ans4RB = new RadioButton();
            TimerLabel = new Label();
            label1 = new Label();
            SuspendLayout();
            // 
            // ExamNameLabel
            // 
            ExamNameLabel.AutoSize = true;
            ExamNameLabel.BackColor = Color.Transparent;
            ExamNameLabel.Font = new Font("Segoe UI", 24F, FontStyle.Bold, GraphicsUnit.Point, 0);
            ExamNameLabel.Location = new Point(306, 23);
            ExamNameLabel.Name = "ExamNameLabel";
            ExamNameLabel.Size = new Size(137, 54);
            ExamNameLabel.TabIndex = 0;
            ExamNameLabel.Text = "label1";
            ExamNameLabel.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // QuestionLabel
            // 
            QuestionLabel.AutoSize = true;
            QuestionLabel.BackColor = SystemColors.Control;
            QuestionLabel.Font = new Font("Segoe UI", 13.8F, FontStyle.Bold, GraphicsUnit.Point, 0);
            QuestionLabel.Location = new Point(22, 131);
            QuestionLabel.Name = "QuestionLabel";
            QuestionLabel.Size = new Size(79, 31);
            QuestionLabel.TabIndex = 1;
            QuestionLabel.Text = "label1";
            // 
            // SubmitButton
            // 
            SubmitButton.BackColor = Color.Pink;
            SubmitButton.Cursor = Cursors.Hand;
            SubmitButton.FlatAppearance.BorderSize = 3;
            SubmitButton.Font = new Font("Segoe UI", 18F, FontStyle.Bold, GraphicsUnit.Point, 0);
            SubmitButton.Location = new Point(648, 381);
            SubmitButton.Name = "SubmitButton";
            SubmitButton.Size = new Size(140, 57);
            SubmitButton.TabIndex = 2;
            SubmitButton.Text = "Next";
            SubmitButton.UseVisualStyleBackColor = false;
            SubmitButton.Click += button1_Click;
            // 
            // Ans1RB
            // 
            Ans1RB.AutoSize = true;
            Ans1RB.Font = new Font("Segoe UI", 10.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            Ans1RB.Location = new Point(22, 212);
            Ans1RB.Name = "Ans1RB";
            Ans1RB.Size = new Size(138, 27);
            Ans1RB.TabIndex = 3;
            Ans1RB.TabStop = true;
            Ans1RB.Text = "radioButton1";
            Ans1RB.UseVisualStyleBackColor = true;
            Ans1RB.CheckedChanged += Ans1RB_CheckedChanged;
            // 
            // Ans2RB
            // 
            Ans2RB.AutoSize = true;
            Ans2RB.Font = new Font("Segoe UI", 10.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            Ans2RB.Location = new Point(437, 212);
            Ans2RB.Name = "Ans2RB";
            Ans2RB.Size = new Size(138, 27);
            Ans2RB.TabIndex = 4;
            Ans2RB.TabStop = true;
            Ans2RB.Text = "radioButton2";
            Ans2RB.UseVisualStyleBackColor = true;
            // 
            // Ans3RB
            // 
            Ans3RB.AutoSize = true;
            Ans3RB.Font = new Font("Segoe UI", 10.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            Ans3RB.Location = new Point(22, 292);
            Ans3RB.Name = "Ans3RB";
            Ans3RB.Size = new Size(138, 27);
            Ans3RB.TabIndex = 5;
            Ans3RB.TabStop = true;
            Ans3RB.Text = "radioButton3";
            Ans3RB.UseVisualStyleBackColor = true;
            // 
            // Ans4RB
            // 
            Ans4RB.AutoSize = true;
            Ans4RB.Font = new Font("Segoe UI", 10.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            Ans4RB.Location = new Point(437, 292);
            Ans4RB.Name = "Ans4RB";
            Ans4RB.Size = new Size(138, 27);
            Ans4RB.TabIndex = 6;
            Ans4RB.TabStop = true;
            Ans4RB.Text = "radioButton4";
            Ans4RB.UseVisualStyleBackColor = true;
            // 
            // TimerLabel
            // 
            TimerLabel.AutoSize = true;
            TimerLabel.BackColor = Color.Transparent;
            TimerLabel.Font = new Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point, 0);
            TimerLabel.Location = new Point(675, 9);
            TimerLabel.Name = "TimerLabel";
            TimerLabel.Size = new Size(70, 28);
            TimerLabel.TabIndex = 7;
            TimerLabel.Text = "label1";
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.BackColor = Color.Transparent;
            label1.Font = new Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label1.Location = new Point(605, 9);
            label1.Name = "label1";
            label1.Size = new Size(64, 28);
            label1.TabIndex = 8;
            label1.Text = "Time:";
            // 
            // ExamLayout
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            BackgroundImage = (Image)resources.GetObject("$this.BackgroundImage");
            BackgroundImageLayout = ImageLayout.Stretch;
            ClientSize = new Size(800, 450);
            Controls.Add(label1);
            Controls.Add(TimerLabel);
            Controls.Add(Ans4RB);
            Controls.Add(Ans3RB);
            Controls.Add(Ans2RB);
            Controls.Add(Ans1RB);
            Controls.Add(SubmitButton);
            Controls.Add(QuestionLabel);
            Controls.Add(ExamNameLabel);
            Name = "ExamLayout";
            Text = "ExamLayout";
            Load += ExamLayout_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label ExamNameLabel;
        private Label QuestionLabel;
        private Button SubmitButton;
        private RadioButton Ans1RB;
        private RadioButton Ans2RB;
        private RadioButton Ans3RB;
        private RadioButton Ans4RB;
        private Label TimerLabel;
        private Label label1;
    }
}