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
    
    public partial class ARTICULOS_RESERVA
    {
        public int Codigo { get; set; }
        public int Cantidad { get; set; }
        public int Articulo { get; set; }
        public string Reserva { get; set; }
    
        public virtual Articulo Articulo1 { get; set; }
        public virtual Reserva Reserva1 { get; set; }
    }
}