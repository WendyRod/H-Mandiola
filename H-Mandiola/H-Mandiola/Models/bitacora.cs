namespace H_Mandiola.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Bitacora")]
    public partial class Bitacora
    {
        [Key]
        [StringLength(10)]
        public string Codigo { get; set; }

        [Column(TypeName = "date")]
        public DateTime Fecha_Hora { get; set; }

        [Required]
        [StringLength(30)]
        public string Tipo { get; set; }

        [Required]
        [StringLength(100)]
        public string Descripcion { get; set; }
    }
}
