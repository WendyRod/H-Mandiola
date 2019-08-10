using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel;
using H_Mandiola.Controllers;
using H_Mandiola.Models;

namespace H_Mandiola.Controllers
{
    public class ConsultasController : Controller
    {
        // GET: Consultas
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Bitacora1()
        {
            return View(GetBitacoraDetails());
        }

        IEnumerable<bitacora> GetBitacoraDetails()
        {
            using (Entities db = new Entities())
            {
                return db.bitacora.ToList<bitacora>();
            }
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