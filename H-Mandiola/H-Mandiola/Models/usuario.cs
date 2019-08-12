namespace H_Mandiola.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Usuario")]
    public partial class Usuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuario()
        {
            Historial_Actividad = new HashSet<Historial_Actividad>();
            Reserva = new HashSet<Reserva>();
            Tarjeta = new HashSet<Tarjeta>();
        }

        [Key]
        [StringLength(10)]
        public string Codigo { get; set; }

        [Required]
        [StringLength(30)]
        public string Nombre { get; set; }

        [Required]
        [StringLength(30)]
        public string Apellido1 { get; set; }

        [Required]
        [StringLength(30)]
        public string Apellido2 { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        [Column("Usuario")]
        [Required]
        [StringLength(30)]
        public string Usuario1 { get; set; }

        [Required]
        [StringLength(15)]
        public string Clave { get; set; }

        [StringLength(50)]
        public string Pregunta { get; set; }

        [StringLength(30)]
        public string Respuesta { get; set; }

        public int Rol { get; set; }

        public int Estado { get; set; }

        public virtual Estado Estado1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Historial_Actividad> Historial_Actividad { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reserva> Reserva { get; set; }

        public virtual Rol Rol1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tarjeta> Tarjeta { get; set; }
    }
}
