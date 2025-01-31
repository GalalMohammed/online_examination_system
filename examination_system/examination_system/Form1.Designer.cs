namespace examination_system
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            roleComboBox = new ComboBox();
            emailLabel = new Label();
            passwordLabel = new Label();
            emailTextBox = new TextBox();
            passwordTextBox = new TextBox();
            loginButton = new Button();
            SuspendLayout();
            // 
            // roleComboBox
            // 
            roleComboBox.Items.AddRange(new object[] { "Admin", "Instructor", "Student" });
            roleComboBox.Location = new Point(300, 50);
            roleComboBox.Name = "roleComboBox";
            roleComboBox.Size = new Size(121, 23);
            roleComboBox.TabIndex = 0;
            roleComboBox.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
            // 
            // emailLabel
            // 
            emailLabel.AutoSize = true;
            emailLabel.Location = new Point(150, 150);
            emailLabel.Name = "emailLabel";
            emailLabel.Size = new Size(36, 15);
            emailLabel.TabIndex = 1;
            emailLabel.Text = "Email";
            emailLabel.Click += label1_Click;
            // 
            // passwordLabel
            // 
            passwordLabel.AutoSize = true;
            passwordLabel.Location = new Point(150, 200);
            passwordLabel.Name = "passwordLabel";
            passwordLabel.Size = new Size(57, 15);
            passwordLabel.TabIndex = 2;
            passwordLabel.Text = "Password";
            // 
            // emailTextBox
            // 
            emailTextBox.Location = new Point(300, 150);
            emailTextBox.Name = "emailTextBox";
            emailTextBox.Size = new Size(100, 23);
            emailTextBox.TabIndex = 3;
            // 
            // passwordTextBox
            // 
            passwordTextBox.Location = new Point(300, 200);
            passwordTextBox.Name = "passwordTextBox";
            passwordTextBox.Size = new Size(100, 23);
            passwordTextBox.TabIndex = 4;
            // 
            // loginButton
            // 
            loginButton.Location = new Point(350, 300);
            loginButton.Name = "loginButton";
            loginButton.Size = new Size(75, 23);
            loginButton.TabIndex = 5;
            loginButton.Text = "Login";
            loginButton.UseVisualStyleBackColor = true;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(loginButton);
            Controls.Add(passwordTextBox);
            Controls.Add(emailTextBox);
            Controls.Add(passwordLabel);
            Controls.Add(emailLabel);
            Controls.Add(roleComboBox);
            Name = "Form1";
            Text = "Form1";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private ComboBox roleComboBox;
        private Label emailLabel;
        private Label passwordLabel;
        private TextBox emailTextBox;
        private TextBox passwordTextBox;
        private Button loginButton;
    }
}
