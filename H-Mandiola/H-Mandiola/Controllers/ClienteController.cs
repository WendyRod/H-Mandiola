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

        [HttpPost]
        public ActionResult CrearCliente(H_Mandiola.Models.Cliente c)
        {
            try
            {
                var result = 0;
                foreach (var item in db.Cliente)
                {
                    if(item.Usuario.Equals(c.Usuario) || item.Email.Equals(c.Email))
                    {
                        result = 1;
                    }
                }
                if(result == 0)
                {
                    db.INSERTA_CLIENTE(c.Nombre, c.Apellido1, c.Apellido2, c.Email, c.Usuario, c.Clave, c.Pregunta, c.Respuesta, c.Estado);
                    db.INSERTA_BITACORA("Agregar", string.Format("Se insertó el cliente: {0}", c.Usuario));
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