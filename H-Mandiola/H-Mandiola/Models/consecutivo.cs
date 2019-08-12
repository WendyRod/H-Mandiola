namespace H_Mandiola.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Consecutivo")]
    public partial class Consecutivo
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Codigo { get; set; }

        [Required]
        [StringLength(50)]
        public string Descripcion { get; set; }

        [Column("Consecutivo")]
        [Required]
        [StringLength(5)]
        public string Consecutivo1 { get; set; }

        public bool? PoseePrefijo { get; set; }

        [StringLength(5)]
        public string Prefijo { get; set; }

        public bool? PoseeRango { get; set; }

        public int? Minimo { get; set; }

        public int? Maximo { get; set; }
    }
}
