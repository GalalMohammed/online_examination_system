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
        public Student1()
        {
            SqlConnection con = new SqlConnection(ConfigLoader.LoadConfig());
            con.Open();
            InitializeComponent();
        }

        private void Student1_Load(object sender, EventArgs e)
        {

        }
    }
}
