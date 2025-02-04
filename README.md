# online_examination_system

An automated system that can perform online exams.

This is a Windows Forms application designed to facilitate examinations. It supports multiple user roles, including instructors and students. Instructors can generate and manage exams, while students can view and take exams, and receive their grades upon completion.

---

## Features

- **User Roles:**
  - **Instructor:** Can generate exams for their courses.
  - **Student:** Can view available exams, select one to take, and receive a grade upon completion.

- **Exam Generation:**
  - Instructors can generate exams by selecting a course and setting exam parameters such as exam name, exam type (MCQ, True/False), and grade settings.

- **Student Exam Interface:**
  - The StudentForm displays available exams.
  - When a student selects an exam, they are transferred to the ExamForm to solve the exam.
  - After exam completion, the system calculates and displays the student's grade.

- **Reporting and Data Management:**
  - The system supports integration with reporting tools.
  - Database dictionaries and ERD diagrams are maintained for ease of development and future enhancements.

---

## Technology Stack

- **Platform:** Windows Forms (WinForms)
- **Language:** C#
- **Database:** Microsoft SQL Server
- **Reporting:** Integration with Report Builder
- **ORM:** Entity Framework

---

## Prerequisites

- .NET
- Microsoft SQL Server
- Report Builder
- Entity Framework

---

## Installation and Setup

This project requires an `.appsettings.json` file for configuration.

### Steps to Set Up

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/GalalMohammed/online_examination_system.git
   ```

2. **Open the Project:**
   - Open the solution file (`.sln`) in Visual Studio.

3. Copy `appsettings.example.json` and rename it to `.appsettings.json`.

4. **Configure the Database and the pathes:**
   - Update the connection string in `.appSettings.json` or your configuration file.
   - Ensure the SQL Server instance is running and accessible.
   - Update the pathes in the configuration file as needed.

5. Right-click on `.appSettings.json` from Visual Studio → Properties
6. Set `Copy to Output Directory` to `Copy if newer` or `Copy always`
7. Save the file.
8. **Restore NuGet Packages:**
   - In Visual Studio, restore NuGet packages to ensure all dependencies are installed.
9. **Build the Solution:**
   - Clean and build the solution to ensure all components are correctly compiled.

---

## Usage

### Instructor Workflow

1. **Login:**
   - Instructors log in through the login form.
  
2. **Exam Generation:**
   - After successful login, instructors access the InstructorForm.
   - Instructors select one of their assigned courses from a ComboBox.
   - They enter the exam details (name, type, grading parameters) and click the "Generate Exam" button.
   - The system generates the exam and displays a success message.

### Student Workflow

1. **View Available Exams:**
   - Students log in and navigate to the StudentForm.
   - The form displays a list of available exams for the student.

2. **Take an Exam:**
   - When the student selects an exam, they are transferred to the ExamForm.
   - The exam is presented, and the student answers the questions.

3. **Receive Grade:**
   - Upon submission, the system evaluates the exam.
   - The student's grade is calculated and displayed.

---

## Troubleshooting

- **Database Connection Issues:**  
  Ensure the connection string is correct and that SQL Server is accessible.

- **RDL File Issues:**  
  Verify that your Report Builder configuration is correctly set up if you experience issues displaying reports.

- **File Locking / Build Errors:**  
  If you encounter file locking issues during build, make sure no instances of the application are running and consider restarting Visual Studio.

---

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your enhancements or bug fixes. Ensure your code adheres to the project’s coding standards and includes appropriate comments/documentation.

---

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/GalalMohammed/online_examination_system/blob/main/LICENSE) file for details.
