namespace H_Mandiola.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Error")]
    public partial class Error
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Codigo { get; set; }

        [Column(TypeName = "date")]
        public DateTime Fecha_Hora { get; set; }

        [Required]
        [StringLength(50)]
        public string Mensaje { get; set; }
    }
}
