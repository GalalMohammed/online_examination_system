﻿using examination_system.Models;
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
    public partial class ExamLayout : Form
    {
        int studentId, ExamID, QuestionCount;
        Examination_SystemContext con;
        List<string> Answers = new();
        private System.Windows.Forms.Timer timer;

        public ExamLayout()
        {
            con = new Examination_SystemContext();
            InitializeComponent();
        }
        public ExamLayout(int Sid, int Examid)
        {
            con = new Examination_SystemContext();
            InitializeComponent();
            studentId = Sid;
            ExamID = Examid;
            QuestionCount = 0;
            timer = new System.Windows.Forms.Timer();
            timer.Interval = 1000;
            timer.Tick += new EventHandler(timer_Tick);
            this.FormClosing += new FormClosingEventHandler(ExamLayout_FormClosing);

        }
        private void ExamLayout_Load(object sender, EventArgs e)
        {
            var Exam = con.Exams.Where(e => e.Id == ExamID).FirstOrDefault();
            ExamNameLabel.Text = Exam.Name;
            TimerLabel.Text = "10:00";
            timer.Start();
            LayoutFunc(QuestionCount);


        }
        private void LayoutFunc(int QuestionNumber)
        {
            var EQlist = con.ExamQuestions.Where(eq => eq.ExamId == ExamID)
                                                 .OrderBy(eq => eq.QuestionOrder)
                                                 .Select(eq => new
                                                 {
                                                     eq.QuestionOrder,
                                                     QuestionText = eq.Question.Text,
                                                     ExamType = eq.Question.Type,
                                                     Choices = con.Choices
                                                     .Where(c => c.QuestionId == eq.QuestionId) // Filter choices by QuestionId
                                                     .Select(c => new
                                                     {
                                                         c.Choice1
                                                     }).ToList()
                                                 })
                                                 .ToList();
            if (EQlist.Count == 0)
            {
                timer.Stop();
                MessageBox.Show("Exam is Empty");
                Student1 student1 = new Student1(studentId);
                this.Hide();
                student1.Show();
                this.Dispose();
                return;
            }
            //MessageBox.Show($"{ExamID}:{EQlist.Count.ToString()}");
            if (QuestionCount == EQlist.Count - 1)
            {
                SubmitButton.Text = "Submit";
            }

            QuestionLabel.Text = $"{EQlist[QuestionCount].QuestionOrder}) " +
                $"{EQlist[QuestionCount].QuestionText}";
            if (EQlist[QuestionCount].ExamType == "TF")
            {
                Ans1RB.Text = "TRUE";
                Ans2RB.Text = "FALSE";
                Ans3RB.Visible = false;
                Ans4RB.Visible = false;
            }
            else
            {
                Ans3RB.Visible = true;
                Ans4RB.Visible = true;
                Ans1RB.Text = EQlist[QuestionCount].Choices[0].Choice1;
                Ans2RB.Text = EQlist[QuestionCount].Choices[1].Choice1;
                Ans3RB.Text = EQlist[QuestionCount].Choices[2].Choice1;
                Ans4RB.Text = EQlist[QuestionCount].Choices[3].Choice1;
            }
            QuestionCount++;

        }
        private async void button1_Click(object sender, EventArgs e)
        {
            if (!CheckAnswer()) { return; }

            if (SubmitButton.Text == "Submit")
            {
                submitExam();
                return;
            }
            LayoutFunc(QuestionCount);

        }
        private bool CheckAnswer()
        {
            if (Ans1RB.Checked)
            {
                Answers.Add(Ans1RB.Text);
                Ans1RB.Checked = false;
            }
            else if (Ans2RB.Checked)
            {
                Answers.Add(Ans2RB.Text);
                Ans2RB.Checked = false;
            }
            else if (Ans3RB.Checked)
            {
                Answers.Add(Ans3RB.Text);
                Ans3RB.Checked = false;
            }
            else if (Ans4RB.Checked)
            {
                Answers.Add(Ans4RB.Text);
                Ans4RB.Checked = false;
            }
            else
            {
                MessageBox.Show("You must Chose an answer");
                return false;
            }
            return true;
        }
        private void timer_Tick(object sender, EventArgs e)
        {
            if (TimerLabel.Text == "00:00")
            {
                timer.Stop();
                MessageBox.Show("Time is up");
                submitExam();
                Student1 student1 = new Student1(studentId);
                this.Hide();
                student1.Show();
                this.Dispose();
                return;
            }
            TimeSpan time = TimeSpan.ParseExact(TimerLabel.Text, @"mm\:ss", null);
            time = time - TimeSpan.FromSeconds(1);
            TimerLabel.Text = time.ToString(@"mm\:ss");
        }
        private void ExamLayout_FormClosing(object sender, FormClosingEventArgs e)
        {
            
            // to prevent the form from closing
            // e.Cancel = true;
            // Or we can implement this logic
            timer.Stop();
            if (Answers.Count == 0) { Answers.Add("No Answers"); } 
            submitExam();
        }
        private async void submitExam()
        {
            Examination_SystemContextProcedures x = new(con);
            string input = String.Join(";", Answers);
            #region with sp
            var res = await x.InsertStudentAnswerAsync(ExamID, studentId, input);
            #endregion
            await x.ExamCorrectionAsync(ExamID, studentId);
            var courseIdOfExam = con.Exams.FirstOrDefault(x => x.Id == ExamID).CourseId;
            MessageBox.Show("Exam Submitted");
            var grade = con.Enrollments.FirstOrDefault(en => en.StudentId == studentId && en.CourseId == courseIdOfExam).Grade;
            MessageBox.Show($"Your Score is {grade}%");
            timer.Stop();
            Student1 student1 = new Student1(studentId);
            this.Hide();
            student1.Show();
            this.Dispose();
        }
        private void Ans1RB_CheckedChanged(object sender, EventArgs e)
        {

        }

        
    }
}
