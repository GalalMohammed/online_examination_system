USE Examination_System;

--Student table
--- Insert
create or alter proc Insert_Student
	@fname varchar(50),
	@lname varchar(50),
	@mail varchar(100),
	@pass varbinary(255),
	@address varchar(100),
	@age int,
	@deparment_ID int
as
	Begin try
		insert into dbo.Student(Fname,Lname,Email,Password,Address,Age,Department_Id) 
		values (@fname,@lname,@mail,@pass,@address,@age,@deparment_ID)
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Update
create or alter proc Update_Student
	@SID int,
	@fname varchar(50),
	@lname varchar(50),
	@mail varchar(100),
	@pass varbinary(255),
	@address varchar(100),
	@age int,
	@deparment_ID int
as
	Begin try
		update dbo.Student
		set Fname=@fname,
			Lname=@lname,
			Email=@mail,
			Password=@pass,
			Address=@address,
			Age=@age,
			Department_Id=@deparment_ID
		where Id=@SID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Delete
create or alter proc Delete_Student
	@SID int
as
	Begin try
		Delete from dbo.Student
		where Id=@SID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Select
create or alter proc Select_Student
	@SID int
as
	Begin try
		Select * from dbo.Student
		where Id=@SID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

-- StudnetAnswer table
--- Insert
create or alter proc Insert_StudentAnswer
	@SID int,
	@EID int,
	@QID int,
	@Choice varchar(100),
	@grade decimal(5,2)
as
	Begin try
		insert into dbo.StudentAnswer(Student_Id,Exam_Id,Question_Id,Choice,Grade)
		values (@SID,@EID,@QID,@Choice,@grade)
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Update
create or alter proc Update_StudentAnswer
	@SID int,
	@EID int,
	@QID int,
	@Choice varchar(100),
	@grade decimal(5,2)
as
	Begin try
		update dbo.StudentAnswer
		set Exam_Id=@EID,
			Question_Id=@QID,
			Choice=@Choice,
			Grade=@grade
		where Student_Id=@SID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Delete
create or alter proc Delete_StudentAnswer
	@SID int
as
	Begin try
		Delete from dbo.StudentAnswer
		where Student_Id=@SID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Select
create or alter proc Select_StudentAnswer
	@SID int
as
	Begin try
		Select * from dbo.StudentAnswer
		where Student_Id=@SID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

-- Department table
--- Insert
create or alter proc Insert_Department
	@name varchar(50),
	@Des varchar(100),
	@MID int
as
	Begin try
		insert into dbo.Department(Name,Description,Manager_Id)
		values (@name,@Des,@MID)
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Update
create or alter proc Update_Department
	@DID int,
	@name varchar(50),
	@Des varchar(100),
	@MID int
as
	Begin try
		update dbo.Department
		set Name=@name,
			Description=@Des,
			Manager_Id=@MID
		where Id=@DID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Delete
create or alter proc Delete_Department
	@DID int
as
	Begin try
		Delete from dbo.Department
		where Id=@DID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Select
create or alter proc Select_Department
	@DID int
as
	Begin try
		Select * from dbo.Department
		where Id=@DID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch