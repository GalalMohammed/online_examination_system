using static System.Net.Mime.MediaTypeNames;

namespace examination_system
{
    partial class Login
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
            roleComboBox.Location = new Point(343, 67);
            roleComboBox.Margin = new Padding(3, 4, 3, 4);
            roleComboBox.Name = "roleComboBox";
            roleComboBox.Size = new Size(158, 28);
            roleComboBox.TabIndex = 0;
            // 
            // emailLabel
            // 
            emailLabel.AutoSize = true;
            emailLabel.Location = new Point(171, 200);
            emailLabel.Name = "emailLabel";
            emailLabel.Size = new Size(46, 20);
            emailLabel.TabIndex = 1;
            emailLabel.Text = "Email";
            emailLabel.Click += label1_Click;
            // 
            // passwordLabel
            // 
            passwordLabel.AutoSize = true;
            passwordLabel.Location = new Point(171, 267);
            passwordLabel.Name = "passwordLabel";
            passwordLabel.Size = new Size(73, 20);
            passwordLabel.TabIndex = 2;
            passwordLabel.Text = "Password:";
            // 
            // emailTextBox
            // 
            emailTextBox.Location = new Point(343, 200);
            emailTextBox.Margin = new Padding(3, 4, 3, 4);
            emailTextBox.Name = "emailTextBox";
            emailTextBox.Size = new Size(215, 27);
            emailTextBox.TabIndex = 3;
            emailTextBox.TextChanged += emailTextBox_TextChanged;
            // 
            // passwordTextBox
            // 
            passwordTextBox.Location = new Point(343, 267);
            passwordTextBox.Margin = new Padding(3, 4, 3, 4);
            passwordTextBox.Name = "passwordTextBox";
            passwordTextBox.Size = new Size(215, 27);
            passwordTextBox.TabIndex = 4;
            passwordTextBox.TextChanged += passwordTextBox_TextChanged;
            // 
            // loginButton
            // 
            loginButton.Location = new Point(400, 400);
            loginButton.Margin = new Padding(3, 4, 3, 4);
            loginButton.Name = "loginButton";
            loginButton.Size = new Size(86, 31);
            loginButton.TabIndex = 5;
            loginButton.Text = "Login";
            loginButton.UseVisualStyleBackColor = true;
            loginButton.Click += loginButton_Click;
            // 
            // Login
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(914, 600);
            Controls.Add(loginButton);
            Controls.Add(passwordTextBox);
            Controls.Add(emailTextBox);
            Controls.Add(passwordLabel);
            Controls.Add(emailLabel);
            Controls.Add(roleComboBox);
            Margin = new Padding(3, 4, 3, 4);
            Name = "Login";
            Text = "Login";
            Load += Form1_Load;
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
