﻿using examination_system.Models;
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
        Student std;
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
            std = con.Students.FirstOrDefault(s => s.Id == id);
        }
        public Student1(Student _std, Examination_SystemContext _con)
        {
            con = _con;
            InitializeComponent();
            std = _std;
            studentId = _std.Id;
        }
        private void Student1_Load(object sender, EventArgs e)
        {


            BackButton.Text = "Logout";
            var studentsList = con.Students.ToList();

            studentId = std.Id;
            WelcomeLabel.Text = $"Welcome {std.Fname} {std.Lname}\n" +
                $"Your ID is {std.Id}";

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
            ExamLayout examLayout = new ExamLayout(studentId, ExamId);
            Hide();
            examLayout.Show();

        }

        private void BackButton_Click(object sender, EventArgs e)
        {
            Login login = new();
            Hide();
            login.Show();
            Dispose();
        }
    }
}
