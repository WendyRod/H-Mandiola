using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security;
using DAL;
using System.ComponentModel.DataAnnotations;



namespace BLL
{
    public class Usuario
    {

        [Required(ErrorMessage = "Ingrese el usuario")]
        [Display(Name = "Ingrese el usuario")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Ingrese la contraseña")]
        [Display(Name = "Ingrese la contraseña")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        //public int UserID { get; set; }
        //[Required]
        //public string usernameL { get; set; }
        //[Required]
        //public string password { get; set; }

        private string _cedula;
        private string _nombre;
        private string _apellido1;
        private string _apellido2;
        private string _email;
        private string _username;
        private string _clave;

        public string cedula
        {
            get { return _cedula; }
            set { _cedula = value; }
        }

        public string nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        public string apellido1
        {
            get { return _apellido1; }
            set { _apellido1 = value; }
        }

        public string apellido2
        {
            get { return _apellido2; }
            set { _apellido2 = value; }
        }

        public string email
        {
            get { return _email; }
            set { _email = value; }
        }

        public string username
        {
            get { return _username; }
            set { _username = value; }
        }

        public string clave
        {
            get { return _clave; }
            set { _clave = value; }
        }



        public void GuardaUsuario()
        {
            

            bool result = true;
            SqlConnection objConn = new SqlConnection();
            objConn.ConnectionString = ConfigurationManager.ConnectionStrings["H-Mandiola"].ToString();


            try
            {

                using (SqlCommand comando = new SqlCommand("USUARIO_REGISTRO", objConn))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.Add("@pCedula", SqlDbType.Int).Value = _cedula;
                    comando.Parameters.Add("@pNombre", SqlDbType.VarChar).Value = _nombre;
                    comando.Parameters.Add("@pApellido1", SqlDbType.VarChar).Value = _apellido1;
                    comando.Parameters.Add("@pApellido2", SqlDbType.VarChar).Value = _apellido2;
                    comando.Parameters.Add("@pCorreo", SqlDbType.VarChar).Value = _email;
                    comando.Parameters.Add("@pUsuario", SqlDbType.VarChar).Value = _username;
                    comando.Parameters.Add("@pClave", SqlDbType.VarChar).Value = _clave;
                    comando.Parameters.Add("@pRol", SqlDbType.Int).Value = 4;
                    comando.Parameters.Add("@pEstado", SqlDbType.Int).Value = 1;
                    comando.Parameters.Add("@pConsecutivo", SqlDbType.Int).Value = 1;
                    DataBase.abrirConexion(objConn);
                    comando.ExecuteNonQuery();
                    DataBase.cerrarConexion(objConn);
                }
            }
            catch (SqlException e)
            {
                Console.Write("ERROR: " + e.Message);
            }
            if (result)
            {
                Console.WriteLine("Datos Ingresados correctamente");
            }
            else
            {
                Console.WriteLine("Los datos no se ingresaron");
            }
        }

        
        public void Login()
        {

            bool result = true;
            //SqlConnection objConn = new SqlConnection();
            string ConnectionString = ConfigurationManager.ConnectionStrings["H-Mandiola"].ToString();
            try
            {
                using (SqlConnection conObj = new SqlConnection(ConnectionString))
            {
                SqlCommand comando = new SqlCommand("USUARIO_LOGIN", conObj);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@pUsuario", UserName);
                comando.Parameters.AddWithValue("@pPassword", Password);
                DataBase.abrirConexion(conObj);
                comando.ExecuteNonQuery();
                DataBase.cerrarConexion(conObj);
                //return Convert.ToInt32(comando.ExecuteScalar());
            }
            }
            catch (SqlException e)
            {
                Console.Write("ERROR: " + e.Message);
            }
            if (result)
            {
                Console.WriteLine("Login exitoso");
            }
            else
            {
                Console.WriteLine("Verifique los datos ingresados");
            }
        }





        //public void LoginConnection()
        //{
        //    //    bool result = true;
        //    SqlConnection objConn = new SqlConnection();
        //    objConn.ConnectionString = ConfigurationManager.ConnectionStrings["H-Mandiola"].ToString();


            //    try
            //    {

            //        using (SqlCommand comando = new SqlCommand("USUARIO_LOGIN", objConn))
            //        {
            //            comando.CommandType = CommandType.StoredProcedure;
            //            comando.Parameters.AddWithValue("@pUsuario", username);
            //            comando.Parameters.AddWithValue("@pPassword", clave);

            //            DataBase.abrirConexion(objConn);
            //            comando.ExecuteNonQuery();
            //            DataBase.cerrarConexion(objConn);
            //        }
            //    }
            //    catch (SqlException e)
            //    {
            //        Console.Write("ERROR: " + e.Message);
            //    }
            //    if (result)
            //    {
            //        Console.WriteLine("Bienvenido");
            //    }
            //    else
            //    {
            //        Console.WriteLine("Login incorrecto");
            //    }
        //}



        public static string CurrentPassword = "", CurrenteUsername = "";

        public void ChangePassword(string pass, string newPass, string confirmPass)
        {

            SqlConnection objConn = new SqlConnection();
            objConn.ConnectionString = ConfigurationManager.ConnectionStrings["H-Mandiola"].ToString();

            string result;
            Usuario User = new Usuario();

            if (pass == "" || newPass == "" || confirmPass == "")
            {
                result = "fail";
            }
            else
            {
                if (pass != CurrentPassword)
                {
                    result = "fail";
                }
                else
                {
                    if (newPass != confirmPass)
                    {
                        result = "fail";
                    }
                    else
                    {

                        using (SqlCommand comando = new SqlCommand("CAMBIO_PASS", objConn))
                        {
                            comando.CommandType = CommandType.StoredProcedure;
                            comando.Parameters.Add("@Username", SqlDbType.VarChar).Value = CurrenteUsername;
                            comando.Parameters.Add("@Password", SqlDbType.VarChar).Value = newPass;
                            DataBase.abrirConexion(objConn);
                            comando.ExecuteNonQuery();
                            DataBase.cerrarConexion(objConn);

                        }
                        CurrentPassword = newPass;
                        result = "Success";
                    }
                }
            }
        }
        }

    //public class UserBusinessLogic
    //{
    //    SqlConnection objConn = new SqlConnection();
    //    objConn.ConnectionString = ConfigurationManager.ConnectionStrings["H-Mandiola"].ToString();
    //    public int CheckUserLogin(User login)
    //    {
    //        using (SqlConnection conObj = new SqlConnection(conStr))
    //        {
    //            SqlCommand comObj = new SqlCommand("USUARIO_LOGIN", conObj);
    //            comObj.CommandType = CommandType.StoredProcedure;
    //            comObj.Parameters.AddWithValue("@pUsuario", login.username);
    //            comObj.Parameters.AddWithValue("@pPassword", login.password);
    //            conObj.Open();
    //            return Convert.ToInt32(comObj.ExecuteScalar());
    //        }
    //    }
    //}
}
