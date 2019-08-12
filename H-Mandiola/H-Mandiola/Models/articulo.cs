namespace H_Mandiola.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Articulo")]
    public partial class Articulo
    {
        [Key]
        [StringLength(10)]
        public string Codigo { get; set; }

        [Required]
        [StringLength(30)]
        public string Nombre { get; set; }

        public int Precio { get; set; }

        public int Tipo_Articulo { get; set; }

        [Required]
        [StringLength(10)]
        public string Reserva { get; set; }

        public virtual Reserva Reserva1 { get; set; }

        public virtual Tipo_Articulo Tipo_Articulo1 { get; set; }
    }
}
