using examination_system.Models;
using Microsoft.Data.SqlClient;
using System.Text;

namespace examination_system
{
    public partial class Login : Form
    {
        Examination_SystemContext context;
        public Login()
        {
            context = new Examination_SystemContext();  
            InitializeComponent();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {


        }

        private void emailTextBox_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void passwordTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        private void loginButton_Click(object sender, EventArgs e)
        {


            // some code LINQ
            //WHERE to Filter DATA
            //var CoursesWithC= context.Courses.Where(c => c.Name.ToLower().StartsWith("c"));

            // Select to some prop of obj
            //for select one 
           // var test2= context.Courses.Select(c => c.Name.ToLower());
            // for multi

           // var test3= context.Courses.Select(c =>new { smallcase = c.Name.ToLower() ,id=c.Id});




            // MessageBox.Show(roleComboBox.Text);

            if (roleComboBox.Text== "Instructor")
            {
               
                
                    var res = context.Instructors.FirstOrDefault(ins => ins.Email == emailTextBox.Text && ins.Password == Encoding.UTF8.GetBytes(passwordTextBox.Text));
                    if (res == null) MessageBox.Show("not found email !");

                    //var res2 = context.Instructors.FirstOrDefault(ins => );
                    //if (res2 == null) MessageBox.Show("not found password !");

            }
            else
            {

                var res = context.Students.FirstOrDefault(stud => stud.Email == emailTextBox.Text
                                                                && stud.Password == Encoding.UTF8.GetBytes(passwordTextBox.Text));
                if (res == null) MessageBox.Show("not found email !");
            }
  
        }

        ~Login()
        {
            context.Dispose();
        }
    }
}
