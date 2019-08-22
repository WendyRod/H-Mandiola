using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;
using H_Mandiola.Models;
using System.Configuration;

namespace H_Mandiola.Controllers
{
    public class UsuarioController : Controller
    {
        //Usuario db = new Usuario();
        private DataContext db = new DataContext();
        private static string connStr = ConfigurationManager.ConnectionStrings["Mandiola"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);
        public static string pass = string.Empty, user = string.Empty;
        //private string Rol_Seguridad = "1,2";

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

        #region Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LoginMethod(H_Mandiola.Models.Usuario userModel)
        {
            var userDetails = db.Usuario.Where(x => x.Usuario1 == userModel.Usuario1 && x.Clave == userModel.Clave).FirstOrDefault();
            if (userDetails == null)
            {
                TempData["msg"] = "El usuario o la clave no son correctos.";
                return RedirectToAction("Login", "Usuario");
            }
            else
            {
                Session["username"] = userDetails.Usuario1;
                //TempData["msg"] = "Login exitoso!";
                return RedirectToAction("Default", "Usuario");
            }
        }

        #endregion

        #region CambiarContraseña
        public ActionResult CambiarContraseña()
        {
            return View();
        }

        public ActionResult CambiarContraseñaUser(string OldPass, string newPass, string confirmPass)
        {
            bool result = true;
            Usuario user = new Usuario();

            if (pass == "" || newPass == "" || confirmPass == "")
            {
                result = false;
            }
            else
            {
                if (OldPass != pass)
                {
                    result = false;
                }
                else
                {
                    if (newPass != confirmPass)
                    {
                        result = false;
                    }
                    else
                    {

                        SqlCommand comando;

                        comando = conn.CreateCommand();

                        comando.CommandText = "Execute CAMBIO_PASS @pUsername, @pPassword";
                        comando.Parameters.Add("@pUsername", SqlDbType.VarChar).Value = user;
                        comando.Parameters.Add("@pPassword", SqlDbType.VarChar).Value = newPass;

                        conn.Open();
                        comando.ExecuteNonQuery();

                        conn.Close();

                        pass = newPass;
                        result = true;

                    }
                }
            }

            return Json(result, JsonRequestBehavior.AllowGet);
        }
        #endregion

        public ActionResult Usuarios()
        {
            return View();
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