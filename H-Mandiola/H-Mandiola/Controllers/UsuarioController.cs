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
        private Entities db = new Entities();
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
        public ActionResult LoginAdmin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LoginAdmin(H_Mandiola.Models.Usuario_Admin userModel)
        {
            //var userDetails = userModel.Usuario1.Where(x => x.Usuario1 == userModel.Usuario1 && x.Clave == userModel.Clave).FirstOrDefault();
            var userDetails = db.Usuario_Admin.Where(x => x.Usuario == userModel.Usuario && x.Clave == userModel.Clave).FirstOrDefault();
            if (userDetails == null)
            {
                TempData["msg"] = "El usuario o la clave no son correctos.";
                return RedirectToAction("LoginAdmin", "Usuario");
            }
            else
            {
                Session["username"] = userDetails.Usuario;
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
            Usuario_Cliente user = new Usuario_Cliente();

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

        /*[HttpPost]
        public ActionResult AsignarRoles(int ID)
        {*/


            //Rol roles = new Rol();
            //currentUseRol = ID;

            //BLL.Usuario usuario = new BLL.Usuario();
            //List<bool> Roles = usuario.SearchRoles(ID);

            #region conditions
            /*if (Roles.ElementAt(0))
            {
                roles.Aministrador = "y";
            }
            else
            {
                roles.Aministrador = "n";
            }

            if (Roles.ElementAt(1))
            {
                roles.Consecutivo = "y";
            }
            else
            {
                roles.Consecutivo = "n";
            }

            if (Roles.ElementAt(2))
            {
                roles.Consulta = "y";
            }
            else
            {
                roles.Consulta = "n";
            }

            if (Roles.ElementAt(3))
            {
                roles.Mantenimiento = "y";
            }
            else
            {
                roles.Mantenimiento = "n";
            }

            if (Roles.ElementAt(4))
            {
                roles.Seguridad = "y";
            }
            else
            {
                roles.Seguridad = "n";
            }*/
            #endregion

          //  BLL.Usuario usuario_Admi = new BLL.Usuario();
            //usuario_Admi.llenarUsuario();

            //return Json(roles, JsonRequestBehavior.AllowGet);
        //}

        /*public ActionResult AsignarRoles()
        {
            Usuario_Admin usuario_Admi = new Usuario_Admin();
            //usuario_Admi.llenarUsuario();

            BLL.Usuario usuario = new BLL.Usuario();
            //List<bool> Roles = usuario.SearchRoles(usuario_Admi.IDUserAdmi);

            /*if (Roles.ElementAt(0) || Roles.ElementAt(4))
            {
                List<Usuario_Admin> UserList = usuario_Admi.llenarUsuarioString();
                ViewBag.UserList = new SelectList(UserList, "ID", "Username");

                return View();
            }
            else
            {
                return View("AfterLogin", User);
            }*/
        //}

        public ActionResult SaveRoles(bool Conse, bool Consul, bool Mante, bool Admi, bool Segu, int currentUseRol)
        {

            BLL.Usuario usuario = new BLL.Usuario();
            usuario.SaveRoles(Conse, Consul, Mante, Admi, Segu, currentUseRol);

            //bitacora.insertaBitacora(CurrenteUsername, "SaveRoles", "Edit", "Save user´s roles", "Consecutive: " + Conse + " - Query: " + Consul + " - Maintenance: " + Mante + " - Administration: " + Admi + " - Security: " + Segu);

            string result = "OK";

            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}