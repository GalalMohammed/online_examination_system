using examination_system.Models;
using System.Text;

namespace examination_system
{
    internal static class Program
    {
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()

        {

            Examination_SystemContext context = new();
            Examination_SystemContextProcedures systemContextProcedures = new(context);
            var OurCourses=  context.Courses.ToList();


            var exam = systemContextProcedures.Exam_GenerationAsync(3,3, "mo khaled test for galal", 5, 5, 2, 3).Result;
            if (exam != null)
            {
                MessageBox.Show("Exam generated successfully");
            }
            else
            {
                MessageBox.Show("Failed to generate exam");
            }



            // To customize application configuration such as set high DPI settings or default font,
            // see https://aka.ms/applicationconfiguration.
            ApplicationConfiguration.Initialize();
            Application.Run(new Login());
        }
    }
}