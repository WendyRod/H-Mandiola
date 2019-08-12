namespace H_Mandiola.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Precio")]
    public partial class Precio
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Precio()
        {
            Habitacion = new HashSet<Habitacion>();
        }

        [Key]
        [StringLength(10)]
        public string Codigo { get; set; }

        public int Tipo_Habitacion { get; set; }

        [Column("Precio")]
        public int? Precio1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Habitacion> Habitacion { get; set; }

        public virtual Tipo_Habitacion Tipo_Habitacion1 { get; set; }
    }
}
