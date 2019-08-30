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

        public static string pass = string.Empty, user = string.Empty;

        Entities1 db = new Entities1();

        public ActionResult Inicio()
        {
            return View();
        }

        public ActionResult LogOut()
        {
            Session.Clear();
            Session.Abandon();
            pass = "";
            user = "";
            return RedirectToAction("LoginCliente", "Cliente");
        }

        public ActionResult CrearCliente()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Inserta_Cliente(BLL.Cliente client)
        {
            try
            {
                var result = 0;
                foreach (var item in db.Cliente)
                {
                    if(item.Usuario.Equals(client.username) || item.Email.Equals(client.email))
                    {
                        result = 1;
                    }
                }
                if(result == 0)
                {
                    client.GuardaCliente();
                    db.INSERTA_BITACORA("Agregar", string.Format("Se insertó el cliente: {0}", client.username));
                    return Json(new { success = true, responseText = "Se ha ingresado el cliente correctamente." }, JsonRequestBehavior.AllowGet);  //Mensaje que se va a mostrar al registrar el usuario.
                }
                else
                {
                    return Json(new { success = false, responseText = "Usuario y/o correo ya existen." }, JsonRequestBehavior.AllowGet); //Mensaje de error mediante Ajax.
                }
            }
            catch (Exception)
            {
                return Json(new { success = false, responseText = "Ha ocurrido un error." }, JsonRequestBehavior.AllowGet);
            }
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