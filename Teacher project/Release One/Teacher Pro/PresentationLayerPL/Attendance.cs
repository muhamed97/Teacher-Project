//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PresentationLayerPL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Attendance
    {
        public int AttendanceID { get; set; }
        public System.DateTime AttendanceDate { get; set; }
        public int studentID { get; set; }
    
        public virtual Student Student { get; set; }
    }
}
