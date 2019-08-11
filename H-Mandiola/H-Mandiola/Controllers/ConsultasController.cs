using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel;
using H_Mandiola.Controllers;
using H_Mandiola.Models;
using BLL;

namespace H_Mandiola.Controllers
{
    public class ConsultasController : Controller
    {

        BitacoraData objBit = new BitacoraData();

        Bitacora bit = new Bitacora();

        // GET: Consultas
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Bitacora()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Bitacora(int? id)
        {
            //return View(GetBitacoraDetails());
            if (id == null)

            {

                return View();

            }

            bitacora bit = objBit.BitacoraDetails(id);

            if (bit == null)

            {

                return View();

            }

            return View(bit);
        }



        //IEnumerable<bitacora> GetBitacoraDetails()
        //{
        //    using (Entities db = new Entities())
        //    {
        //        return db.bitacora.ToList<bitacora>();
        //    }
        //}

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