using examination_system.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.Text;

namespace examination_system
{
    public partial class Login : Form
    {
        Examination_SystemContext context;
        public Login()
        {
            InitializeComponent();
            context = new Examination_SystemContext();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            //string reportBuilderPath = @"""C:\Program Files (x86)\Microsoft Report Builder\MSReportBuilder.exe""";
            //string reportFilePath = @"C:\Users\dell\Desktop\ExamAndQuestionsReport.rdl";

            //ProcessStartInfo startInfo = new ProcessStartInfo(reportBuilderPath)
            //{
            //    Arguments = reportFilePath,
            //    UseShellExecute = false
            //};

            //Process process = Process.Start(startInfo);
            //process.WaitForExit();
            //this.reportViewer1.ProcessingMode = ProcessingMode.Local;
            //this.reportViewer1.LocalReport.ReportPath = @"C:\Users\dell\Desktop\ExamAndQuestionsReport.rdl";

            //// Add any necessary report parameters or data sources here

            //this.reportViewer1.RefreshReport();

        }

        private void emailTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        private void passwordTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        private void loginButton_Click(object sender, EventArgs e)
        {
            if ( roleComboBox.Text == "Instructor" )
            {
                var instructor = context.Instructors.FirstOrDefault( ins => ins.Email == emailTextBox.Text && ins.Password == Encoding.UTF8.GetBytes(passwordTextBox.Text) );
                if ( instructor == null )
                    MessageBox.Show("Invalid email or password");
                else
                {
                    InstructorForm instructorForm = new(instructor, context);
                    instructorForm.Show();
                    this.Hide();
                }
            }
            else if (roleComboBox.Text == "Student")
            {
                var student = context.Students.FirstOrDefault(std => std.Email == emailTextBox.Text && std.Password == Encoding.UTF8.GetBytes(passwordTextBox.Text));
                if (student == null)
                    MessageBox.Show("Invalid email or password");
                else
                {
                    Student1 studentForm = new(student, context);
                    studentForm.Show();
                    this.Hide();
                }
            }

        }

        private void Login_Load(object sender, EventArgs e)
        {

        }

        ~Login()
        {
            context.Dispose();
        }
    }
}
