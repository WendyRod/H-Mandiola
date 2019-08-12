namespace H_Mandiola.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Historial_Actividad
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Codigo { get; set; }

        [Required]
        [StringLength(10)]
        public string Usuario { get; set; }

        [Required]
        [StringLength(10)]
        public string Actividad { get; set; }

        public virtual Actividad Actividad1 { get; set; }

        public virtual Usuario Usuario1 { get; set; }
    }
}
