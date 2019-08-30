using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security;
using DAL;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;

namespace BLL
{
    public class Usuario
    {

        private static string connStr = ConfigurationManager.ConnectionStrings["Mandiola"].ConnectionString;

        public static int Codigo;

        private string _nombre;
        private string _apellido1;
        private string _apellido2;
        private string _email;
        private string _username;
        private string _clave;
        private bool _admin;
        private bool _segu;
        private bool _conse;
        private bool _mante;
        private bool _consu;

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

        public bool admin
        {
            get { return _admin; }
            set { _admin = value; }
        }

        public bool segu
        {
            get { return _segu; }
            set { _segu = value; }
        }

        public bool conse
        {
            get { return _conse; }
            set { _conse = value; }
        }

        public bool mante
        {
            get { return _mante; }
            set { _mante = value; }
        }

        public bool consu
        {
            get { return _consu; }
            set { _consu = value; }
        }


        public void GuardaUsuario()
        {
            bool result = true;
            SqlConnection objConn = new SqlConnection();
            objConn.ConnectionString = ConfigurationManager.ConnectionStrings["Mandiola"].ToString();
            
            try
            {
                using (SqlCommand comando = new SqlCommand("INSERTA_ADMIN", objConn))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.Add("@pNombre", SqlDbType.VarChar).Value = _nombre;
                    comando.Parameters.Add("@pApellido1", SqlDbType.VarChar).Value = _apellido1;
                    comando.Parameters.Add("@pApellido2", SqlDbType.VarChar).Value = _apellido2;
                    comando.Parameters.Add("@pCorreo", SqlDbType.VarChar).Value = _email;
                    comando.Parameters.Add("@pUsuario", SqlDbType.VarChar).Value = _username;
                    comando.Parameters.Add("@pClave", SqlDbType.VarChar).Value = _clave;
                    comando.Parameters.Add("@pAdministrador", SqlDbType.Bit).Value = 1;
                    comando.Parameters.Add("@pSeguridad", SqlDbType.Bit).Value = 1;
                    comando.Parameters.Add("@pConsecutivo", SqlDbType.Bit).Value = 1;
                    comando.Parameters.Add("@pMantenimiento", SqlDbType.Bit).Value = 1;
                    comando.Parameters.Add("@pConsulta", SqlDbType.Bit).Value = 1;
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

        public List<bool> SearchRoles(int Codigo)
        {
            var rolesList = new List<bool>();

            using (SqlConnection conn = new SqlConnection(connStr))
            {

                conn.Open();

                SqlCommand cmd = new SqlCommand("OBTENER_ROLES", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@pCodigo", Codigo);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    rolesList.Add(Convert.ToBoolean(dr["Administrador"].ToString()));

                    rolesList.Add(Convert.ToBoolean(dr["Consecutivo"].ToString()));

                    rolesList.Add(Convert.ToBoolean(dr["Consulta"].ToString()));

                    rolesList.Add(Convert.ToBoolean(dr["Mantenimiento"].ToString()));

                    rolesList.Add(Convert.ToBoolean(dr["Seguridad"].ToString()));
                    
                }
                conn.Close();
            }
            return rolesList;
        }

        public void SaveRoles(bool Conse, bool Consul, bool Mante, bool Admi, bool Segu, int currentUseRol)
        {
            SqlConnection conn = new SqlConnection();

            SqlCommand com;

            com = conn.CreateCommand();

            com.CommandText = "Execute ACTUALIZA_ADMIN_ROLES  @pAdministrador, @pConsecutivo, @pConsulta,@pMantenimiento, @pSeguridad, @pCodigo";
            com.Parameters.Add("@pAdministrador", SqlDbType.Bit).Value = Admi;
            com.Parameters.Add("@pConsecutivo", SqlDbType.Bit).Value = Conse;
            com.Parameters.Add("@pConsulta", SqlDbType.Bit).Value = Consul;
            com.Parameters.Add("@pMantenimiento", SqlDbType.Bit).Value = Mante;
            com.Parameters.Add("@pSeguridad", SqlDbType.Bit).Value = Segu;
            com.Parameters.Add("@pCodigo", SqlDbType.VarChar).Value = currentUseRol;

            conn.Open();
            com.ExecuteNonQuery();

            conn.Close();
        }

    }

}
