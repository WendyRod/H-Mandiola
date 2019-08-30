using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace H_Mandiola.Models
{
    public class Roles
    {
        public string Consecutivo { get; set; }
        public string Mantenimiento { get; set; }
        public string Consulta { get; set; }

        public string Seguridad { get; set; }
        public string Administrador { get; set; }
    }
}