namespace H_Mandiola.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Tarjeta")]
    public partial class Tarjeta
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Codigo { get; set; }

        public int Numero_Tarjeta { get; set; }

        [Column(TypeName = "date")]
        public DateTime Fecha_Exp { get; set; }

        [Required]
        [StringLength(10)]
        public string Usuario { get; set; }

        public int Emisor { get; set; }

        public virtual Emisor Emisor1 { get; set; }

        public virtual Usuario Usuario1 { get; set; }
    }
}
