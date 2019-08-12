namespace H_Mandiola.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BookingID")]
    public partial class BookingID
    {
        [Key]
        [StringLength(1)]
        public string Codigo { get; set; }

        [Required]
        [StringLength(10)]
        public string Habitacion { get; set; }

        [Required]
        [StringLength(10)]
        public string Reserva { get; set; }

        public virtual Habitacion Habitacion1 { get; set; }

        public virtual Reserva Reserva1 { get; set; }
    }
}
