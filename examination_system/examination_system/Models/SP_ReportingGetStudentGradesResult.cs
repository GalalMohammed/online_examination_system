﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace examination_system.Models
{
    public partial class SP_ReportingGetStudentGradesResult
    {
        public string CourseName { get; set; }
        [Column("Grade", TypeName = "decimal(18,2)")]
        public decimal? Grade { get; set; }
        [Column("Percentage", TypeName = "decimal(5,2)")]
        public decimal? Percentage { get; set; }
    }
}
