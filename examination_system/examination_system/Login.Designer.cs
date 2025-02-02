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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Login));
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
            roleComboBox.Size = new Size(158, 28);
            roleComboBox.TabIndex = 0;
            // 
            // emailLabel
            // 
            emailLabel.BackColor = SystemColors.ActiveCaption;
            emailLabel.Font = new System.Drawing.Font("Sans Serif Collection", 8.999999F);
            emailLabel.Location = new Point(150, 150);
            emailLabel.Name = "emailLabel";
            emailLabel.Size = new Size(75, 30);
            emailLabel.TabIndex = 1;
            emailLabel.Text = "Email";
            emailLabel.Click += label1_Click;
            // 
            // passwordLabel
            // 
            passwordLabel.BackColor = SystemColors.ActiveCaption;
            passwordLabel.Font = new System.Drawing.Font("Sans Serif Collection", 8.999999F);
            passwordLabel.Location = new Point(150, 200);
            passwordLabel.Name = "passwordLabel";
            passwordLabel.Size = new Size(75, 30);
            passwordLabel.TabIndex = 2;
            passwordLabel.Text = "Password:";
            // 
            // emailTextBox
            // 
            emailTextBox.Location = new Point(260, 150);
            emailTextBox.Name = "emailTextBox";
            emailTextBox.Size = new Size(215, 27);
            emailTextBox.TabIndex = 3;
            emailTextBox.TextChanged += emailTextBox_TextChanged;
            // 
            // passwordTextBox
            // 
            passwordTextBox.Location = new Point(260, 200);
            passwordTextBox.Name = "passwordTextBox";
            passwordTextBox.Size = new Size(215, 27);
            passwordTextBox.TabIndex = 4;
            passwordTextBox.TextChanged += passwordTextBox_TextChanged;
            // 
            // loginButton
            // 
            loginButton.BackColor = SystemColors.ActiveCaption;
            loginButton.Font = new System.Drawing.Font("Sans Serif Collection", 8.999999F, FontStyle.Bold, GraphicsUnit.Point, 0);
            loginButton.Location = new Point(282, 300);
            loginButton.Name = "loginButton";
            loginButton.Size = new Size(90, 40);
            loginButton.TabIndex = 5;
            loginButton.Text = "Login";
            loginButton.UseVisualStyleBackColor = false;
            loginButton.Click += loginButton_Click;
            // 
            // Login
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.IndianRed;
            BackgroundImage = (System.Drawing.Image)resources.GetObject("$this.BackgroundImage");
            BackgroundImageLayout = ImageLayout.Stretch;
            ClientSize = new Size(800, 450);
            Controls.Add(loginButton);
            Controls.Add(passwordTextBox);
            Controls.Add(emailTextBox);
            Controls.Add(passwordLabel);
            Controls.Add(emailLabel);
            Controls.Add(roleComboBox);
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
