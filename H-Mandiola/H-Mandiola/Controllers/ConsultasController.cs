using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace H_Mandiola.Controllers
{
    public class ConsultasController : Controller
    {
        // GET: Consultas
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Bitacora()
        {
            return View();
        }

        public ActionResult ClientesActivos()
        {
            return View();
        }

        public ActionResult Errores()
        {
            return View();
        }

        public ActionResult HabitacionesListas()
        {
            return View();
        }
    }
}