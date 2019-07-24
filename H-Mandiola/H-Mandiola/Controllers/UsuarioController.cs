using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace H_Mandiola.Controllers
{
    public class UsuarioController : Controller
    {
        // GET: Usuario
        

        #region CrearUsuario
        public ActionResult CrearUsuario()
        {
            return View();
        }

        public ActionResult SaveValues(BLL.Usuario user)
        {
            user.GuardaUsuario();

            return Content("Success");
        }
        #endregion

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult LoginMethod(BLL.Usuario user)
        {
            user.Login();

            return Content("Success");
        }

        public ActionResult CambiarContraseña()
        {
            return View();
        }

        public ActionResult ChangePassword(BLL.Usuario user)
        {
         

            return Content("Success");
        }

        public ActionResult VerUsuarios()
        {
            return View();
        }

        public ActionResult Default()
        {
            return View();
        }
    }
}