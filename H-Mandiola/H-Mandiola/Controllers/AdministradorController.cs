using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace H_Mandiola.Controllers
{
    public class AdministradorController : Controller
    {
        // GET: Administrador
        
        public ActionResult Actividades()
        {
            return View();
        }

        public ActionResult Consecutivos()
        {
            return View();
        }

        public ActionResult EstadoClientes()
        {
            return View();
        }

        public ActionResult Habitaciones()
        {
            return View();
        }

        public ActionResult Precios()
        {
            return View();
        }
    }
}