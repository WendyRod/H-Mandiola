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
    
    public partial class Historial_Actividad
    {
        public int Codigo { get; set; }
        public string Usuario { get; set; }
        public string Actividad { get; set; }
    
        public virtual Actividad Actividad1 { get; set; }
        public virtual Usuario_Cliente Usuario_Cliente { get; set; }
    }
}
