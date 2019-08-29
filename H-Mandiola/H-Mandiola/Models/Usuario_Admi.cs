using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace H_Mandiola.Models
{
    public class Usuario_Admi
    {
        public int Codigo { get; set; }
        public string Usuario { get; set; }
        public string Clave { get; set; }
        public string Nombre { get; set; }
        public string Apellido1 { get; set; }
        public string Apellido2 { get; set; }
        public string Email { get; set; }
        public bool Administrador { get; set; }
        public bool Seguridad { get; set; }
        public bool Consecutivo { get; set; }
        public bool Mantenimiento { get; set; }
        public bool Consulta { get; set; }


        public string Conexion_String = ConfigurationManager.ConnectionStrings["H-Mandiola"].ToString();
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["H-Mandiola"].ToString()); //catalog= bd_demo


        public void llenarUsuario()
        {


            List<Usuario_Admi> list = new List<Usuario_Admi>();


            using (SqlConnection cn = new SqlConnection(Conexion_String))
            {
                cn.Open();

                SqlCommand cmd = new SqlCommand("Alvaro_llenarUsuario", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Username", "a");

                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Usuario_Admi item = new Usuario_Admi();
                    item.Codigo = Convert.ToInt32(reader["ID"]);
                    item.Usuario = Convert.ToString(reader["Username"]);
                    item.Clave = Convert.ToString(reader["Password"]);
                    item.Nombre = Convert.ToString(reader["Nombre"]);
                    item.Apellido1 = Convert.ToString(reader["Apellido1"]);
                    item.Apellido2 = Convert.ToString(reader["Apellido2"]);
                    item.Email = Convert.ToString(reader["Correo"]);
                    item.Administrador = Convert.ToBoolean(reader["Administrador"]);
                    item.Seguridad = Convert.ToBoolean(reader["Seguridad"]);
                    item.Consecutivo = Convert.ToBoolean(reader["Consecutivo"]);
                    item.Mantenimiento = Convert.ToBoolean(reader["Mantenimiento"]);
                    item.Consulta = Convert.ToBoolean(reader["Consulta"]);

                    list.Add(item);
                }
                cn.Close();
            }
        }


        public List<Usuario_Admi> llenarUsuarioString()
        {

            List<Usuario_Admi> list = new List<Usuario_Admi>();

            using (SqlConnection cn = new SqlConnection(Conexion_String))
            {
                cn.Open();

                SqlCommand cmd = new SqlCommand("Alvaro_llenarUsuario", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Username", "a");

                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Usuario_Admi item = new Usuario_Admi();
                    item.Codigo = Convert.ToInt32(reader["ID"]);
                    item.Nombre = Convert.ToString(reader["Nombre"]);
                    item.Apellido1 = Convert.ToString(reader["Apellido1"]);
                    item.Apellido2 = Convert.ToString(reader["Apellido2"]);
                    item.Email = Convert.ToString(reader["Correo"]);
                    item.Usuario = Convert.ToString(reader["Username"]);
                    item.Clave = Convert.ToString(reader["Password"]);
                    item.Administrador = Convert.ToBoolean(reader["Administrador"]);
                    item.Seguridad = Convert.ToBoolean(reader["Seguridad"]);
                    item.Consecutivo = Convert.ToBoolean(reader["Consecutivo"]);
                    item.Mantenimiento = Convert.ToBoolean(reader["Mantenimiento"]);
                    item.Consulta = Convert.ToBoolean(reader["Consulta"]);

                    list.Add(item);
                }
                cn.Close();
            }
            return list;
        }
    }
}