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


        //private string _codigo;
        private string _nombre;
        private string _apellido1;
        private string _apellido2;
        private string _email;
        private string _username;
        private string _clave;

        //public string codigo
        //{
        //    get { return codigo; }
        //    set { codigo = value; }
        //}

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
            objConn.ConnectionString = ConfigurationManager.ConnectionStrings["Mandiola"].ToString();
            
            try
            {
                using (SqlCommand comando = new SqlCommand("USUARIO_REGISTRO", objConn))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    //comando.Parameters.Add("@pCedula", SqlDbType.VarChar).Value = _cedula;
                    //comando.Parameters.Add("@pCodigo", SqlDbType.VarChar).Value = _codigo;
                    comando.Parameters.Add("@pNombre", SqlDbType.VarChar).Value = _nombre;
                    comando.Parameters.Add("@pApellido1", SqlDbType.VarChar).Value = _apellido1;
                    comando.Parameters.Add("@pApellido2", SqlDbType.VarChar).Value = _apellido2;
                    comando.Parameters.Add("@pCorreo", SqlDbType.VarChar).Value = _email;
                    comando.Parameters.Add("@pUsuario", SqlDbType.VarChar).Value = _username;
                    comando.Parameters.Add("@pClave", SqlDbType.VarChar).Value = _clave;
                    comando.Parameters.Add("@pRol", SqlDbType.Int).Value = 4;
                    comando.Parameters.Add("@pEstado", SqlDbType.Int).Value = 1;
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
        }

}
