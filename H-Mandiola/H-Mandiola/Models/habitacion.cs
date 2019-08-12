namespace H_Mandiola.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Habitacion")]
    public partial class Habitacion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Habitacion()
        {
            BookingID = new HashSet<BookingID>();
        }

        [Key]
        [StringLength(10)]
        public string Codigo { get; set; }

        [Required]
        public int Numero { get; set; }

        [Required]
        [StringLength(250)]
        public string Descripcion { get; set; }

        [Display(Name = "Detalle")]
        public int Est_Hab { get; set; }

        [Required]
        [StringLength(10)]
        public string Precio { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookingID> BookingID { get; set; }

        public virtual Est_Hab Est_Hab1 { get; set; }

        public virtual Precio Precio1 { get; set; }
    }
}
