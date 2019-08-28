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
        public ActionResult CrearUsuario()
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
                foreach (var item in db.Usuario) //Verificamos la lista.
                {
                    if (item.Usuario1.Equals(user.username) || item.Email.Equals(user.email))    //Comparamos los datos con los ya existentes.
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
                    return Json(new { success = false, responseText = "Usuario y/o coreo ya existen." }, JsonRequestBehavior.AllowGet); //Mensaje de error mediante Ajax.
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
                //TempData["msg"] = "Login exitoso!"
                return RedirectToAction("Default", "Usuario");
            }
        }

        #endregion

        #region CambiarContraseña
        public ActionResult CambiarContraseña()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CambiarClaveUser(string OldPass, string NewPass, string ConfirmPass)
        {
            Usuario user = new Usuario();
            return Json(new { success = true, responseText = "Exito. " + OldPass + "." }, JsonRequestBehavior.AllowGet); //Mensaje de error mediante Ajax.
            //if (NewPass.Equals(OldPass)) //Las contraseñas nuevas deben de ser iguales.
            //{
            //    string PassActual = string.Empty;
            //    foreach (var item in db.Usuario)
            //    {
            //        if (item.Usuario1.Equals("diegoalru"))
            //        {
            //            PassActual = item.Clave;
            //        }
            //        else
            //        {
            //            /* Continua la busqueda del usuario*/
            //        }
            //    }

            //    /*
            //     * En caso de que no se encuentre el usuario.
            //     */
            //    if (PassActual.Equals(string.Empty))
            //    {
            //        return Json(new { success = false, responseText = "Error interno." }, JsonRequestBehavior.AllowGet); //Mensaje de error mediante Ajax.
            //    }
            //    else
            //    {
            //        if (PassActual.Equals(NewPass))
            //        {
            //            return Json(new { success = false, responseText = "La contraseña es igual que la anterior." }, JsonRequestBehavior.AllowGet); //Mensaje de error mediante Ajax.
            //        }
            //        else
            //        {
            //            return Json(new { success = true, responseText = "Exito. " + OldPass + "." }, JsonRequestBehavior.AllowGet); //Mensaje de error mediante Ajax.
            //        }
            //    }
            //}
            //else
            //{
            //    return Json(new { success = false, responseText = "Las contraseñas no coinciden." }, JsonRequestBehavior.AllowGet); //Mensaje de error mediante Ajax.
            //}
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