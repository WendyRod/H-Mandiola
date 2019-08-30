//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace H_Mandiola.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Reserva
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Reserva()
        {
            this.Articulo = new HashSet<Articulo>();
            this.BookingID = new HashSet<BookingID>();
        }
    
        public string Codigo { get; set; }
        public System.DateTime Fecha_Entrada { get; set; }
        public System.DateTime Fecha_Salida { get; set; }
        public int Cantidad_Dias { get; set; }
        public bool Codigo_Promocional { get; set; }
        public int Cantidad_Adultos { get; set; }
        public int Cantidad_Niños { get; set; }
        public bool Mascota { get; set; }
        public string Metodo_Pago { get; set; }
        public Nullable<int> Precio { get; set; }
        public string Usuario { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Articulo> Articulo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookingID> BookingID { get; set; }
        public virtual Usuario_Cliente Usuario_Cliente { get; set; }
    }
}
