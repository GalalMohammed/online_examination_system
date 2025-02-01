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


            var res = systemContextProcedures.Insert_StudentAsync(
                        "test mk",
                        "testtest",
                        "hmmad@test.com",
                        Encoding.UTF8.GetBytes("test from Windows App"),
                        "32.fesial",
                        25,
                        2
                    ).Result;

            // To customize application configuration such as set high DPI settings or default font,
            // see https://aka.ms/applicationconfiguration.
            ApplicationConfiguration.Initialize();
            Application.Run(new Login());
        }
    }
}