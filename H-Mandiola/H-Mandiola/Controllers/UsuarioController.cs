using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;
using H_Mandiola.Models;


namespace H_Mandiola.Controllers
{
    public class UsuarioController : Controller
    {
        Entities db = new Entities();
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-WENDY\\SQLEXPRESS; Initial Catalog=H-Mandiola; Integrated Security=True");
        public static string pass = "", user = "";

        // GET: Usuario
        

        #region CrearUsuario
        public ActionResult CrearUsuario()
        {
            return View();
        }

        [HttpPost]
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

        public JsonResult LoginUser(usuario model)
        {
            string result = "Fail";
            var Data = db.usuario.Where(x => x.username == model.usuario1 && x.password == model.clave).SingleOrDefault());
            if(Data != null)
            {
                pass = model.clave;
                user = model.usuario1;
                Session["UserID"] = Data.cedula.toString();
                Session["UserName"] = Data.usuario1.toString();
                result = "Success";
            }
            return Json(result, JsonRequestBehavior.AllowGet);
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