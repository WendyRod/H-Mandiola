using DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Cliente
    {

        private static string connStr = ConfigurationManager.ConnectionStrings["Mandiola"].ConnectionString;

        
        private string _nombre;
        private string _apellido1;
        private string _apellido2;
        private string _email;
        private string _username;
        private string _clave;
        private string _pregunta;
        private string _respuesta;
        private int _estado = 1;

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

        public string pregunta
        {
            get { return _pregunta; }
            set { _pregunta = value; }
        }

        public string respuesta
        {
            get { return _respuesta; }
            set { _respuesta = value; }
        }

        public int estado
        {
            get { return _estado; }
            set { _estado = value; }
        }


        public void GuardaCliente()
        {
            bool result = true;
            SqlConnection objConn = new SqlConnection();
            objConn.ConnectionString = ConfigurationManager.ConnectionStrings["Mandiola"].ToString();

            try
            {
                using (SqlCommand comando = new SqlCommand("INSERTA_CLIENTE", objConn))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.Add("@pNombre", SqlDbType.VarChar).Value = _nombre;
                    comando.Parameters.Add("@pApellido1", SqlDbType.VarChar).Value = _apellido1;
                    comando.Parameters.Add("@pApellido2", SqlDbType.VarChar).Value = apellido2;
                    comando.Parameters.Add("@pCorreo", SqlDbType.VarChar).Value = _email;
                    comando.Parameters.Add("@pUsuario", SqlDbType.VarChar).Value = _username;
                    comando.Parameters.Add("@pClave", SqlDbType.VarChar).Value = _clave;
                    comando.Parameters.Add("@pPregunta", SqlDbType.VarChar).Value = _pregunta;
                    comando.Parameters.Add("@pRespuesta", SqlDbType.VarChar).Value = _respuesta;
                    comando.Parameters.Add("@pEstado", SqlDbType.Int).Value = _estado;
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
