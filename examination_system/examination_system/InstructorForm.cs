using examination_system.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace examination_system
{
    public partial class InstructorForm : Form
    {
        Instructor instructor;
        Examination_SystemContext context;
        public InstructorForm(Instructor _instructor, Examination_SystemContext context)
        {
            instructor = _instructor;
            this.context = context;
            InitializeComponent();
        }

        private void InstructorForm_Load(object sender, EventArgs e)
        {
            try
            {
                context.Entry(instructor).Collection(i => i.Courses).Load();
                instructorCoursesComboBox.DataSource = instructor.Courses;
                instructorCoursesComboBox.DisplayMember = "Name";
                instructorCoursesComboBox.ValueMember = "Id";
            }
            catch (Exception)
            {
                MessageBox.Show("Failed to load courses");
            }
        }

        private async void examGenerationButton_Click(object sender, EventArgs e)
        {
            bool isMCQValid = int.TryParse(examGenerationMCQTextBox.Text, out int mcq);
            bool isTFValid = int.TryParse(examGenerationTFTextBox.Text, out int tf);
            bool isMCQGradeValid = int.TryParse(examGenarationMCQGradeTextBox.Text, out int mcqGrade);
            bool isTFGradeValid = int.TryParse(examGenerationTFGradeTextBox.Text, out int tfGrade);
            object? selectedItem = instructorCoursesComboBox.SelectedItem;
            if (selectedItem == null)
            {
                MessageBox.Show("Please select a course");
                return;
            }
            Course course = (Course)selectedItem;
            if (!isMCQValid || !isTFValid || !isMCQGradeValid || !isTFGradeValid)
                MessageBox.Show("Please enter valid numbers");
            else
            {
                Examination_SystemContextProcedures spContext = new(context);
                try
                {
                    var exam = await spContext.Exam_GenerationAsync(instructor.Id, course.Id, examGenerationNameTextBox.Text ?? null, mcq, tf, mcqGrade, tfGrade);
                    if (exam != null)
                        MessageBox.Show("Exam generated successfully", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    else
                        MessageBox.Show("Failed to generate exam");
                }
                catch (Exception)
                {
                    MessageBox.Show("Failed to generate exam");
                }
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void departmentStudentsReportButton_Click(object sender, EventArgs e)
        {
            string? reportPath = ConfigLoader.LoadConfig("DepartmentStudentsReportPath");
            if (reportPath == null)
                MessageBox.Show("DepartmentStudentsReportPath is not set in the configuration file");
            else
                OpenRdlInReportBuilder(reportPath);
        }
        private static void OpenRdlInReportBuilder(string reportPath)
        {
            string? reportBuilderPath = ConfigLoader.LoadConfig("ReportBuilderPath");
            if (reportBuilderPath == null)
                MessageBox.Show("Report Builder path is not set in the configuration file");
            else
                try
                {
                    System.Diagnostics.Process.Start(reportBuilderPath, $"\"{reportPath}\"");
                }
                catch (Exception)
                {
                    MessageBox.Show("Failed to open Report Builder");
                }
        }

        private void studentCoursesReportButton_Click(object sender, EventArgs e)
        {
            string? reportPath = ConfigLoader.LoadConfig("StudentCoursesReportPath");
            if (reportPath == null)
                MessageBox.Show("StudentCoursesReportPath is not set in the configuration file");
            else
                OpenRdlInReportBuilder(reportPath);
        }

        private void instructorCoursesReportButton_Click(object sender, EventArgs e)
        {
            string? reportPath = ConfigLoader.LoadConfig("InstructorCoursesReportPath");
            if (reportPath == null)
                MessageBox.Show("InstructorCoursesReportPath is not set in the configuration file");
            else
                OpenRdlInReportBuilder(reportPath);
        }

        private void courseTopicsReportButton_Click(object sender, EventArgs e)
        {
            string? reportPath = ConfigLoader.LoadConfig("CourseTopicsReportPath");
            if (reportPath == null)
                MessageBox.Show("CourseTopicsReportPath is not set in the configuration file");
            else
                OpenRdlInReportBuilder(reportPath);
        }

        private void examReportButton_Click(object sender, EventArgs e)
        {
            string? reportPath = ConfigLoader.LoadConfig("ExamReportPath");
            if (reportPath == null)
                MessageBox.Show("ExamReportPath is not set in the configuration file");
            else
                OpenRdlInReportBuilder(reportPath);
        }

        private void studentSolutionReportButton_Click(object sender, EventArgs e)
        {
            string? reportPath = ConfigLoader.LoadConfig("StudentAnswersReportPath");
            if (reportPath == null)
                MessageBox.Show("StudentAnswersReportPath is not set in the configuration file");
            else
                OpenRdlInReportBuilder(reportPath);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Login login = new();
            Hide();
            login.Show();
            Dispose();
        }
    }
}
