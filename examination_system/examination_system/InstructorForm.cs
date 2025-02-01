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
            instructorCoursesComboBox.DataSource = instructor.Courses;
            instructorCoursesComboBox.DisplayMember = "Name";
            instructorCoursesComboBox.ValueMember = "Id";
        }

        private void InstructorForm_Load(object sender, EventArgs e)
        {

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
                var exam = await spContext.Exam_GenerationAsync(instructor.Id, course.Id, examGenerationNameTextBox.Text ?? null, mcq, tf, mcqGrade, tfGrade);
                if (exam != null)
                    MessageBox.Show("Exam generated successfully");
                else
                    MessageBox.Show("Failed to generate exam");
            }
        }
    }
}
