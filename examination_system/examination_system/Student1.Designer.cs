namespace examination_system
{
    partial class Student1
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
            components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Student1));
            WelcomeLabel = new Label();
            contextMenuStrip1 = new ContextMenuStrip(components);
            ExamListBox = new ListBox();
            label2 = new Label();
            StartButton = new Button();
            SuspendLayout();
            // 
            // WelcomeLabel
            // 
            WelcomeLabel.AutoSize = true;
            WelcomeLabel.BackColor = Color.Transparent;
            WelcomeLabel.Font = new Font("Segoe UI", 24F, FontStyle.Bold, GraphicsUnit.Point, 0);
            WelcomeLabel.Location = new Point(169, 21);
            WelcomeLabel.Name = "WelcomeLabel";
            WelcomeLabel.Size = new Size(208, 54);
            WelcomeLabel.TabIndex = 0;
            WelcomeLabel.Text = "Welcome ";
            WelcomeLabel.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // contextMenuStrip1
            // 
            contextMenuStrip1.ImageScalingSize = new Size(20, 20);
            contextMenuStrip1.Name = "contextMenuStrip1";
            contextMenuStrip1.Size = new Size(61, 4);
            // 
            // ExamListBox
            // 
            ExamListBox.AllowDrop = true;
            ExamListBox.FormattingEnabled = true;
            ExamListBox.Location = new Point(40, 194);
            ExamListBox.Name = "ExamListBox";
            ExamListBox.Size = new Size(594, 204);
            ExamListBox.TabIndex = 2;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.BackColor = Color.Transparent;
            label2.Font = new Font("Segoe UI", 13.8F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label2.Location = new Point(40, 163);
            label2.Name = "label2";
            label2.Size = new Size(192, 31);
            label2.TabIndex = 3;
            label2.Text = "Available Exams:";
            // 
            // StartButton
            // 
            StartButton.BackColor = Color.Pink;
            StartButton.Cursor = Cursors.Hand;
            StartButton.FlatAppearance.BorderColor = SystemColors.Control;
            StartButton.FlatAppearance.BorderSize = 3;
            StartButton.FlatStyle = FlatStyle.Popup;
            StartButton.Font = new Font("Segoe UI", 13.8F, FontStyle.Bold, GraphicsUnit.Point, 0);
            StartButton.Location = new Point(654, 347);
            StartButton.Name = "StartButton";
            StartButton.Size = new Size(123, 51);
            StartButton.TabIndex = 4;
            StartButton.Text = "Start";
            StartButton.UseVisualStyleBackColor = false;
            StartButton.Click += button1_Click;
            // 
            // Student1
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            BackgroundImage = (Image)resources.GetObject("$this.BackgroundImage");
            BackgroundImageLayout = ImageLayout.Stretch;
            ClientSize = new Size(800, 450);
            Controls.Add(StartButton);
            Controls.Add(label2);
            Controls.Add(ExamListBox);
            Controls.Add(WelcomeLabel);
            FormBorderStyle = FormBorderStyle.Fixed3D;
            Name = "Student1";
            Text = "Student1";
            Load += Student1_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label WelcomeLabel;
        private ContextMenuStrip contextMenuStrip1;
        private ListBox ExamListBox;
        private Label label2;
        private Button StartButton;
    }
}