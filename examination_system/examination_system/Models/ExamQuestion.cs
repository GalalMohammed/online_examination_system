﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace examination_system.Models;

[PrimaryKey("ExamId", "QuestionId")]
[Table("ExamQuestion")]
public partial class ExamQuestion
{
    [Key]
    [Column("Exam_Id")]
    public int ExamId { get; set; }

    [Key]
    [Column("Question_Id")]
    public int QuestionId { get; set; }

    [Column("Question_Order")]
    public int QuestionOrder { get; set; }

    [ForeignKey("ExamId")]
    [InverseProperty("ExamQuestions")]
    public virtual Exam Exam { get; set; }

    [ForeignKey("QuestionId")]
    [InverseProperty("ExamQuestions")]
    public virtual Question Question { get; set; }

    [InverseProperty("ExamQuestion")]
    public virtual ICollection<StudentAnswer> StudentAnswers { get; set; } = new List<StudentAnswer>();
}