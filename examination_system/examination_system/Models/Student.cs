﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace examination_system.Models;

[Table("Student")]
public partial class Student
{
    [Key]
    public int Id { get; set; }

    [Required]
    [StringLength(50)]
    [Unicode(false)]
    public string Fname { get; set; }

    [Required]
    [StringLength(50)]
    [Unicode(false)]
    public string Lname { get; set; }

    [Required]
    [StringLength(100)]
    [Unicode(false)]
    public string Email { get; set; }

    [Required]
    [MaxLength(255)]
    public byte[] Password { get; set; }

    [StringLength(100)]
    [Unicode(false)]
    public string Address { get; set; }

    public int? Age { get; set; }

    [Column("Department_Id")]
    public int DepartmentId { get; set; }

    [ForeignKey("DepartmentId")]
    [InverseProperty("Students")]
    public virtual Department Department { get; set; }

    [InverseProperty("Student")]
    public virtual ICollection<Enrollment> Enrollments { get; set; } = new List<Enrollment>();

    [InverseProperty("Student")]
    public virtual ICollection<StudentAnswer> StudentAnswers { get; set; } = new List<StudentAnswer>();
}