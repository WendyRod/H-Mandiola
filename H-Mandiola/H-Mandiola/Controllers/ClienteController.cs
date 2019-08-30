using H_Mandiola.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace H_Mandiola.Controllers
{
    public class ClienteController : Controller
    {

        Entities db = new Entities();

        public ActionResult Inicio()
        {
            return View();
        }

        public ActionResult CrearCliente()
        {
            return View();
        }

        public ActionResult Reserva()
        {
            return View();
        }

        public ActionResult CambiarPass()
        {
            return View();
        }

        public ActionResult CatalogoHab()
        {
            return View();
        }

        public ActionResult LoginCliente()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LoginCliente(H_Mandiola.Models.Cliente userModel)
        {
            //var userDetails = userModel.Usuario1.Where(x => x.Usuario1 == userModel.Usuario1 && x.Clave == userModel.Clave).FirstOrDefault();
            var userDetails = db.Cliente.Where(x => x.Usuario == userModel.Usuario && x.Clave == userModel.Clave).FirstOrDefault();
            if (userDetails == null)
            {
                TempData["msg"] = "El usuario o la clave no son correctos.";
                return RedirectToAction("LoginCliente", "Cliente");
            }
            else
            {
                Session["username"] = userDetails.Usuario;
                //TempData["msg"] = "Login exitoso!";
                return RedirectToAction("Inicio", "Cliente");
            }
        }
    }
}