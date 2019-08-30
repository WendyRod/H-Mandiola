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
        private Entities db = new Entities();
        private static string connStr = ConfigurationManager.ConnectionStrings["Mandiola"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);
        public static string pass = string.Empty, user = string.Empty;
        //private string Rol_Seguridad = "1,2";

        // GET: Usuario
        #region CrearUsuario
        /// <summary>
        /// Constructor de la pagina Usuario/CrearUsuario
        /// </summary>
        /// <returns>Retorna la pagina.</returns>
        public ActionResult CrearUsuarioAdmin()
        {
            return View();
        }
        /// <summary>
        /// Metodo para agregar el usuario.
        /// </summary>
        /// <param name="user">Datos del usuaruio que se va a registrar.</param>
        [HttpPost]
        public ActionResult SaveValues(BLL.Usuario user)
        {
            try
            {
                //Variable que indica si existe o no el usuario.
                var result = 0; //Valor 0 es que no existe el usuario.
                foreach (var item in db.Usuario_Admin) //Verificamos la lista.
                {
                    if (item.Usuario.Equals(user.username) || item.Email.Equals(user.email))    //Comparamos los datos con los ya existentes.
                    {
                        result = 1; //Si ya existe, se cambia el valor.
                    }
                    else
                    {
                        /* Si no existe no se hace nada. */
                    }
                }

                if (result == 0)    //Se verifica que no exista el usuario.
                {
                    user.GuardaUsuario();   //Se inserta el usuario en la base de datos.
                    db.INSERTA_BITACORA("Agregar", string.Format("Se insertó el usuario: {0}", user.username)); //Se agrega el registro el usuario en la base de datos.
                    return Json(new { success = true, responseText = "Se ha ingresado el usuario correctamente." }, JsonRequestBehavior.AllowGet);  //Mensaje que se va a mostrar al registrar el usuario.
                }
                else  //En caso de que ya exista el dato.
                {
                    // Datos ya exixtentes //
                    return Json(new { success = false, responseText = "Usuario y/o correo ya existen." }, JsonRequestBehavior.AllowGet); //Mensaje de error mediante Ajax.
                }
            }
            catch (Exception)
            {
                Console.WriteLine("Error en SaveValues.");
                return Json(new { success = false, responseText = "Ha ocurrido un error." }, JsonRequestBehavior.AllowGet); //Mensaje de error mediante Ajax.
            }
        }
        #endregion

        #region Login
        /// <summary>
        /// Constructor de la pagina Usuario/Login.
        /// </summary>
        /// <returns>Retorna la pagina.</returns>
        public ActionResult LoginAdmin()
        {
            return View();
        }


        #endregion

        #region CambiarContraseña
        public ActionResult CambiarContraseña()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CambiarClaveUser(PassClass claves)
        {
            //string OldPass, string NewPass, string ConfirmPass
            //Usuario_Admin user = new Usuario_Admin();
            Usuario_Cliente cliente = new Usuario_Cliente();

            if (claves.NewPass.Equals(claves.OldPass)) //Las contraseñas nuevas deben de ser iguales.
            {
                string PassActual = string.Empty;
                foreach (var item in db.Usuario_Cliente)
                {
                    if (item.Usuario.Equals("diegoalru"))
                    {
                        PassActual = item.Clave;
                    }
                    else
                    {
                        /* Continua la busqueda del usuario*/
                    }
                }

                /*
                 * En caso de que no se encuentre el usuario.
                 */
                if (PassActual.Equals(string.Empty))
                {
                    return Json(new { success = false, responseText = "Error interno." }, JsonRequestBehavior.AllowGet); //Mensaje de error mediante Ajax.
                }
                else
                {
                    if (PassActual.Equals(claves.NewPass))
                    {
                        return Json(new { success = false, responseText = "La contraseña es igual que la anterior." }, JsonRequestBehavior.AllowGet); //Mensaje de error mediante Ajax.
                    }
                    else
                    {
                        return Json(new { success = true, responseText = "Exito. " + claves.OldPass + "." }, JsonRequestBehavior.AllowGet); //Mensaje de error mediante Ajax.
                    }
                }
            }
            else
            {
                return Json(new { success = false, responseText = "Las contraseñas no coinciden." }, JsonRequestBehavior.AllowGet); //Mensaje de error mediante Ajax.
            }
        }
        #endregion


        public ActionResult Usuarios()
        {
            return View();
        }

        public ActionResult Default()
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

        public static int currentUseRol = 0;

        public ActionResult VerUsuarios()
        {
            Usuario_Admi usuario_Admi = new Usuario_Admi();
            usuario_Admi.llenarUsuario();

            BLL.Usuario usuario = new BLL.Usuario();
            List<bool> Roles = usuario.SearchRoles(BLL.Usuario.Codigo);

            if (Roles.ElementAt(0) || Roles.ElementAt(4))
            {
                List<Usuario_Admi> UserList = usuario_Admi.llenarUsuarioString();
                ViewBag.UserList = new SelectList(UserList, "Codigo", "Usuario");

                return View();
            }
            else
            {
                return View("Default", usuario);
            }

        }

        [HttpPost]
        public ActionResult VerUsuarios(int ID)
        {
            Roles roles = new Roles();
            currentUseRol = ID;

            BLL.Usuario usuario = new BLL.Usuario();
            List<bool> Roles = usuario.SearchRoles(ID);

            #region conditions
            if (Roles.ElementAt(0))
            {
                roles.Administrador = "y";
            }
            else
            {
                roles.Administrador = "n";
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
            }
            #endregion

            Usuario_Admi usuarioAdmin = new Usuario_Admi();
            usuarioAdmin.llenarUsuario();

            return Json(roles, JsonRequestBehavior.AllowGet);
        }

        public ActionResult SaveRoles(bool Conse, bool Consul, bool Mante, bool Admi, bool Segu)
        {

            BLL.Usuario usuario = new BLL.Usuario();
            usuario.SaveRoles(Conse, Consul, Mante, Admi, Segu, currentUseRol);
            
            string result = "OK";

            return Json(result, JsonRequestBehavior.AllowGet);
        }

    }

    public class PassClass
    {
        public string OldPass { get; set; }
        public string NewPass { get; set; }
        public string ConfirmedPass { get; set; }

        public PassClass(string oldPass, string newPass, string confirmedPass)
        {
            OldPass = oldPass;
            NewPass = newPass;
            ConfirmedPass = confirmedPass;
        }
    }
}