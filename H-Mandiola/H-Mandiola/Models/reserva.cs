namespace H_Mandiola.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Reserva")]
    public partial class Reserva
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Reserva()
        {
            Articulo = new HashSet<Articulo>();
            BookingID = new HashSet<BookingID>();
        }

        [Key]
        [StringLength(10)]
        public string Codigo { get; set; }

        [Column(TypeName = "date")]
        public DateTime Fecha_Entrada { get; set; }

        [Column(TypeName = "date")]
        public DateTime Fecha_Salida { get; set; }

        public int Cantidad_Dias { get; set; }

        [Required]
        [StringLength(1)]
        public string Codigo_Promocional { get; set; }

        public int Cantidad_Adultos { get; set; }

        public int Cantidad_Niños { get; set; }

        [Required]
        [StringLength(1)]
        public string Mascota { get; set; }

        [Required]
        [StringLength(1)]
        public string Metodo_Pago { get; set; }

        public int? Precio { get; set; }

        [Required]
        [StringLength(10)]
        public string Usuario { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Articulo> Articulo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookingID> BookingID { get; set; }

        public virtual Usuario Usuario1 { get; set; }
    }
}
