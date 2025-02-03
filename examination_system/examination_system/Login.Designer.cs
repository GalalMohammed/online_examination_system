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
            label1 = new Label();
            SuspendLayout();
            // 
            // roleComboBox
            // 
            roleComboBox.Items.AddRange(new object[] { "Instructor", "Student" });
            roleComboBox.Location = new Point(252, 36);
            roleComboBox.Margin = new Padding(3, 4, 3, 4);
            roleComboBox.Name = "roleComboBox";
            roleComboBox.Size = new Size(245, 28);
            roleComboBox.TabIndex = 0;
            roleComboBox.Text = "Chose a role";

            // 
            // emailLabel
            // 
            emailLabel.BackColor = Color.Transparent;
            emailLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, FontStyle.Bold, GraphicsUnit.Point, 0);
            emailLabel.Location = new Point(111, 126);
            emailLabel.Name = "emailLabel";
            emailLabel.Size = new Size(86, 40);
            emailLabel.TabIndex = 1;
            emailLabel.Text = "Email";
            emailLabel.TextAlign = ContentAlignment.MiddleCenter;
            emailLabel.Click += label1_Click;
            // 
            // passwordLabel
            // 
            passwordLabel.BackColor = Color.Transparent;
            passwordLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, FontStyle.Bold, GraphicsUnit.Point, 0);
            passwordLabel.Location = new Point(102, 194);
            passwordLabel.Name = "passwordLabel";
            passwordLabel.Size = new Size(107, 40);
            passwordLabel.TabIndex = 2;
            passwordLabel.Text = "Password:";
            passwordLabel.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // emailTextBox
            // 
            emailTextBox.Location = new Point(252, 135);
            emailTextBox.Margin = new Padding(3, 4, 3, 4);
            emailTextBox.Name = "emailTextBox";
            emailTextBox.Size = new Size(245, 27);
            emailTextBox.TabIndex = 3;
            emailTextBox.TextChanged += emailTextBox_TextChanged;
            // 
            // passwordTextBox
            // 
            passwordTextBox.Location = new Point(252, 194);
            passwordTextBox.Margin = new Padding(3, 4, 3, 4);
            passwordTextBox.Name = "passwordTextBox";
            passwordTextBox.PasswordChar = '*';
            passwordTextBox.Size = new Size(245, 27);
            passwordTextBox.TabIndex = 4;
            // 
            // loginButton
            // 
            loginButton.BackColor = SystemColors.ActiveCaption;
            loginButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, FontStyle.Bold, GraphicsUnit.Point, 0);
            loginButton.Location = new Point(549, 253);
            loginButton.Margin = new Padding(3, 4, 3, 4);
            loginButton.Name = "loginButton";
            loginButton.Size = new Size(103, 53);
            loginButton.TabIndex = 5;
            loginButton.Text = "Login";
            loginButton.UseVisualStyleBackColor = false;
            loginButton.Click += loginButton_Click;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.BackColor = Color.Transparent;
            label1.Font = new System.Drawing.Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label1.Location = new Point(127, 36);
            label1.Name = "label1";
            label1.Size = new Size(54, 28);
            label1.TabIndex = 6;
            label1.Text = "Role";
            // 
            // Login
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.IndianRed;
            BackgroundImage = (System.Drawing.Image)resources.GetObject("$this.BackgroundImage");
            BackgroundImageLayout = ImageLayout.Stretch;
            ClientSize = new Size(694, 361);
            Controls.Add(label1);
            Controls.Add(loginButton);
            Controls.Add(passwordTextBox);
            Controls.Add(emailTextBox);
            Controls.Add(passwordLabel);
            Controls.Add(emailLabel);
            Controls.Add(roleComboBox);
            Margin = new Padding(3, 4, 3, 4);
            MaximumSize = new Size(712, 408);
            MinimumSize = new Size(712, 408);
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
        private Label label1;
    }
}
