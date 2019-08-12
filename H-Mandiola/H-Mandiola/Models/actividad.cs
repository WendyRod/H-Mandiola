namespace H_Mandiola.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Actividad")]
    public partial class Actividad
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Actividad()
        {
            Historial_Actividad = new HashSet<Historial_Actividad>();
        }

        [Key]
        [StringLength(10)]
        public string Codigo { get; set; }

        [Required]
        [StringLength(30)]
        public string Nombre { get; set; }

        [Required]
        [StringLength(30)]
        public string Descripcion { get; set; }

        [Required]
        [StringLength(1)]
        public string Dia { get; set; }

        [Column(TypeName = "date")]
        public DateTime Horainicio { get; set; }

        [Column(TypeName = "date")]
        public DateTime Horafinal { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Historial_Actividad> Historial_Actividad { get; set; }
    }
}
