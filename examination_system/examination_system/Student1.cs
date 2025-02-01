using examination_system.Models;
using Microsoft.Data.SqlClient;
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
    public partial class Student1 : Form
    {
        Examination_SystemContext con;
        
        int studentId;
        List<int> ExamIds;
        public Student1()
        {
            con = new Examination_SystemContext();
            InitializeComponent();
        }
        public Student1(int id)
        {
            con = new Examination_SystemContext();
            InitializeComponent();
            studentId = id;
        }
        private async void Student1_Load(object sender, EventArgs e)
        {
            #region ado
            //string CNS = ConfigLoader.LoadConfig();
            //SqlConnection con = new SqlConnection(CNS);
            //con.Open();
            //string querystring = "SELECT * from Course;";
            //SqlCommand cmd = new SqlCommand(querystring, con);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //MessageBox.Show(ds.Tables[0].Rows[0][1].ToString());
            #endregion
            //var re = systemConextProcedures.
            //MessageBox.Show(con.Students.FirstOrDefault.ToString());
            //Examination_SystemContextProcedures x = new(con);
            //var res = x.Insert_StudentAsync("hammad5", "1", "t55@test.com", Encoding.UTF8.GetBytes("123456"), "add", 25, 4).Result;

            var studentsList = con.Students.ToList();
            int index = 0;
            for (int i = 0; i < studentsList.Count; i++)
            {
                if (studentsList[i].Email == Login.emailText)
                {
                    index = i;
                    break;
                }
            }
            studentId = studentsList[index].Id;
            WelcomeLabel.Text = $"Welcome {studentsList[index].Fname} {studentsList[index].Lname}\n" +
                $"Your ID is {studentsList[index].Id}";

            var examsNotAnsweredByStudent = con.Students
                        .Where(s => s.Id == studentId)
                        .SelectMany(s => s.Enrollments) 
                        .SelectMany(e => e.Course.Exams) 
                        .Where(exam => !con.StudentAnswers.Any(sa => sa.StudentId == studentId && sa.ExamId == exam.Id))
                        .Select(exam => new
                        {
                            exam.Id,
                            exam.Name

                        })
                        .ToList();
            //MessageBox.Show($"{studentId}:{examsNotAnsweredByStudent.GetType()}");
            //MessageBox.Show($"{studentId}:{examsNotAnsweredByStudent.Count.ToString()}");
            ExamIds = new();
            for (int i = 0; i < examsNotAnsweredByStudent.Count; i++)
            {
                if (examsNotAnsweredByStudent[i].Name == null)
                {
                    ExamListBox.Items.Add($"Exam id {examsNotAnsweredByStudent[i].Id} has no name");
                }
                else
                {
                    ExamListBox.Items.Add(examsNotAnsweredByStudent[i].Name);
                }
                
                ExamIds.Add(examsNotAnsweredByStudent[i].Id);
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (ExamListBox.SelectedIndex == -1)
            {
                MessageBox.Show("Please select an exam");
                return;
            }
            int examIndex = ExamListBox.SelectedIndex;
            int ExamId = ExamIds[examIndex];
            ExamLayout examLayout = new ExamLayout(studentId,ExamId);
            Hide();
            examLayout.Show();

        }
    }
}
