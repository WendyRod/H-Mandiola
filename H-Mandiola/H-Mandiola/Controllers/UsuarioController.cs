﻿using System;
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

        #region Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LoginMethod(H_Mandiola.Models.usuario userModel)
        {
            var userDetails = db.usuario.Where(x => x.usuario1 == userModel.usuario1 && x.clave == userModel.clave).FirstOrDefault();
            if (userDetails == null)
            {
                TempData["msg"] = "El usuario o la clave no son correctos.";
                return RedirectToAction("Login", "Usuario");
            }
            else
            {
                Session["username"] = userDetails.usuario1;
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
            usuario user = new usuario();

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