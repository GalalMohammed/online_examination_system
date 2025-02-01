namespace examination_system
{
    partial class InstructorForm
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
            examGenerationLabel = new Label();
            examGenerationCourseLabel = new Label();
            instructorCoursesComboBox = new ComboBox();
            examGenerationNameLabel = new Label();
            examGenerationNameTextBox = new TextBox();
            examGenerationMCQLabel = new Label();
            examGenerationMCQTextBox = new TextBox();
            examGenerationMCQGradeLabel = new Label();
            examGenarationMCQGradeTextBox = new TextBox();
            examGenerationTFLabel = new Label();
            examGearationTFGradeLabel = new Label();
            examGenerationTFTextBox = new TextBox();
            examGenerationTFGradeTextBox = new TextBox();
            examGenerationButton = new Button();
            SuspendLayout();
            // 
            // examGenerationLabel
            // 
            examGenerationLabel.AutoSize = true;
            examGenerationLabel.Location = new Point(40, 40);
            examGenerationLabel.Name = "examGenerationLabel";
            examGenerationLabel.Size = new Size(96, 15);
            examGenerationLabel.TabIndex = 0;
            examGenerationLabel.Text = "Exam Generation";
            // 
            // examGenerationCourseLabel
            // 
            examGenerationCourseLabel.AutoSize = true;
            examGenerationCourseLabel.Location = new Point(40, 75);
            examGenerationCourseLabel.Name = "examGenerationCourseLabel";
            examGenerationCourseLabel.Size = new Size(44, 15);
            examGenerationCourseLabel.TabIndex = 1;
            examGenerationCourseLabel.Text = "Course";
            // 
            // instructorCoursesComboBox
            // 
            instructorCoursesComboBox.FormattingEnabled = true;
            instructorCoursesComboBox.Location = new Point(140, 75);
            instructorCoursesComboBox.Name = "instructorCoursesComboBox";
            instructorCoursesComboBox.Size = new Size(121, 23);
            instructorCoursesComboBox.TabIndex = 2;
            // 
            // examGenerationNameLabel
            // 
            examGenerationNameLabel.AutoSize = true;
            examGenerationNameLabel.Location = new Point(45, 110);
            examGenerationNameLabel.Name = "examGenerationNameLabel";
            examGenerationNameLabel.Size = new Size(39, 15);
            examGenerationNameLabel.TabIndex = 3;
            examGenerationNameLabel.Text = "Name";
            // 
            // examGenerationNameTextBox
            // 
            examGenerationNameTextBox.Location = new Point(140, 110);
            examGenerationNameTextBox.Name = "examGenerationNameTextBox";
            examGenerationNameTextBox.Size = new Size(100, 23);
            examGenerationNameTextBox.TabIndex = 4;
            // 
            // examGenerationMCQLabel
            // 
            examGenerationMCQLabel.AutoSize = true;
            examGenerationMCQLabel.Location = new Point(45, 145);
            examGenerationMCQLabel.Name = "examGenerationMCQLabel";
            examGenerationMCQLabel.Size = new Size(35, 15);
            examGenerationMCQLabel.TabIndex = 5;
            examGenerationMCQLabel.Text = "MCQ";
            // 
            // examGenerationMCQTextBox
            // 
            examGenerationMCQTextBox.Location = new Point(140, 145);
            examGenerationMCQTextBox.Name = "examGenerationMCQTextBox";
            examGenerationMCQTextBox.Size = new Size(100, 23);
            examGenerationMCQTextBox.TabIndex = 6;
            // 
            // examGenerationMCQGradeLabel
            // 
            examGenerationMCQGradeLabel.AutoSize = true;
            examGenerationMCQGradeLabel.Location = new Point(45, 180);
            examGenerationMCQGradeLabel.Name = "examGenerationMCQGradeLabel";
            examGenerationMCQGradeLabel.Size = new Size(69, 15);
            examGenerationMCQGradeLabel.TabIndex = 7;
            examGenerationMCQGradeLabel.Text = "MCQ Grade";
            // 
            // examGenarationMCQGradeTextBox
            // 
            examGenarationMCQGradeTextBox.Location = new Point(140, 180);
            examGenarationMCQGradeTextBox.Name = "examGenarationMCQGradeTextBox";
            examGenarationMCQGradeTextBox.Size = new Size(100, 23);
            examGenarationMCQGradeTextBox.TabIndex = 8;
            // 
            // examGenerationTFLabel
            // 
            examGenerationTFLabel.AutoSize = true;
            examGenerationTFLabel.Location = new Point(45, 215);
            examGenerationTFLabel.Name = "examGenerationTFLabel";
            examGenerationTFLabel.Size = new Size(20, 15);
            examGenerationTFLabel.TabIndex = 9;
            examGenerationTFLabel.Text = "TF";
            // 
            // examGearationTFGradeLabel
            // 
            examGearationTFGradeLabel.AutoSize = true;
            examGearationTFGradeLabel.Location = new Point(45, 250);
            examGearationTFGradeLabel.Name = "examGearationTFGradeLabel";
            examGearationTFGradeLabel.Size = new Size(54, 15);
            examGearationTFGradeLabel.TabIndex = 10;
            examGearationTFGradeLabel.Text = "TF Grade";
            // 
            // examGenerationTFTextBox
            // 
            examGenerationTFTextBox.Location = new Point(140, 215);
            examGenerationTFTextBox.Name = "examGenerationTFTextBox";
            examGenerationTFTextBox.Size = new Size(100, 23);
            examGenerationTFTextBox.TabIndex = 11;
            // 
            // examGenerationTFGradeTextBox
            // 
            examGenerationTFGradeTextBox.Location = new Point(140, 250);
            examGenerationTFGradeTextBox.Name = "examGenerationTFGradeTextBox";
            examGenerationTFGradeTextBox.Size = new Size(100, 23);
            examGenerationTFGradeTextBox.TabIndex = 12;
            // 
            // examGenerationButton
            // 
            examGenerationButton.Location = new Point(103, 285);
            examGenerationButton.Name = "examGenerationButton";
            examGenerationButton.Size = new Size(75, 23);
            examGenerationButton.TabIndex = 13;
            examGenerationButton.Text = "Generate";
            examGenerationButton.UseVisualStyleBackColor = true;
            examGenerationButton.Click += examGenerationButton_Click;
            // 
            // InstructorForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(examGenerationButton);
            Controls.Add(examGenerationTFGradeTextBox);
            Controls.Add(examGenerationTFTextBox);
            Controls.Add(examGearationTFGradeLabel);
            Controls.Add(examGenerationTFLabel);
            Controls.Add(examGenarationMCQGradeTextBox);
            Controls.Add(examGenerationMCQGradeLabel);
            Controls.Add(examGenerationMCQTextBox);
            Controls.Add(examGenerationMCQLabel);
            Controls.Add(examGenerationNameTextBox);
            Controls.Add(examGenerationNameLabel);
            Controls.Add(instructorCoursesComboBox);
            Controls.Add(examGenerationCourseLabel);
            Controls.Add(examGenerationLabel);
            Name = "InstructorForm";
            Text = "InstructorForm";
            Load += InstructorForm_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label examGenerationLabel;
        private Label examGenerationCourseLabel;
        private ComboBox instructorCoursesComboBox;
        private Label examGenerationNameLabel;
        private TextBox examGenerationNameTextBox;
        private Label examGenerationMCQLabel;
        private TextBox examGenerationMCQTextBox;
        private Label examGenerationMCQGradeLabel;
        private TextBox examGenarationMCQGradeTextBox;
        private Label examGenerationTFLabel;
        private Label examGearationTFGradeLabel;
        private TextBox examGenerationTFTextBox;
        private TextBox examGenerationTFGradeTextBox;
        private Button examGenerationButton;
    }
}