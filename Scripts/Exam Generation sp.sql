USE Examination_System;

create or alter proc Exam_Generation
	@Ins_ID int,
	@C_ID int,
	@EName varchar(100),
	@MCQ_num int,
	@TF_num int,
	@MCQ_grade int,
	@TF_grade int
as
	begin try
		begin transaction
			--Check if instructor teaches said Course
			Declare @E_ID int
			if (Exists(Select * from Teaching where Instructor_Id=@Ins_ID and Course_Id=@C_ID))
			begin
				insert into dbo.Exam(Instructor_Id,Course_Id,Name,MCQ_Grade,TF_Grade,Date) 
				values (@Ins_ID,@C_ID,@EName,@MCQ_grade,@TF_grade,GETDATE());
				set @E_ID=SCOPE_IDENTITY();
			end
			else
			begin
				THROW 50001, 'Instructor does not teach the specified course.', 1;	
			end
			--Retrive the Course questions 
			Declare @MCQ_Final_Table table( Q_ID int);
			Declare @TF_Final_Table table( Q_ID int);
			Declare @MCQ_Table table( Q_ID int );
			Insert into @MCQ_Table(Q_ID) Select Id from Question where Type='MCQ' and Course_Id=@C_ID
			Declare @MCQ_COUNT int
			set @MCQ_COUNT=(Select COUNT(Q_ID) From @MCQ_Table)
			if (@MCQ_COUNT >= @MCQ_num)
			begin
				insert into @MCQ_Final_Table select top(@MCQ_num) Q_ID from @MCQ_Table order by NEWID();
			end
			else
			begin
				THROW 50002, 'Not enough MCQ questions.', 1;	
			end
			
			Declare @TF_Table table( Q_ID int );
			Insert into @TF_Table Select Id from Question where Type='TF' and Course_Id=@C_ID
			Declare @TF_COUNT int
			set @TF_COUNT=(Select COUNT(Q_ID) From @TF_Table)
			if (@TF_COUNT >= @TF_num)
				begin
					insert into @TF_Final_Table select top(@TF_num) Q_ID from @TF_Table order by NEWID();
				end
			else
			begin
				THROW 50003, 'Not enough True or false questions.', 1;	
			end
			
			Declare @RowNumberedData table(
				Exam_ID int,
				Question_ID int,
				Q_Order int)
			insert into @RowNumberedData SELECT
					@E_ID,  -- First column (constant value)
					t1.Q_ID,  -- Second column (merging two columns)
					ROW_NUMBER() OVER (ORDER BY NEWID())  -- Third column (sequential count starting from 1)
				FROM (Select Q_ID from @MCQ_Final_Table union all Select Q_ID from @TF_Final_Table) t1;
			

			--insert into ExamQuestion 
			insert into dbo.ExamQuestion(Exam_Id,Question_Id,Question_Order) 
			select Exam_ID,Question_ID,Q_Order from @RowNumberedData
		commit transaction
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
		rollback transaction
	end catch;

