using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using DAL;

namespace H_Mandiola.Models
{
    public class BitacoraData
    {

        //DataBase db = new DataBase();

        SqlConnection objConn = new SqlConnection();
        

        public bitacora BitacoraDetails(int? id)
        {
            bitacora bit = new bitacora();
            objConn.ConnectionString = ConfigurationManager.ConnectionStrings["H-Mandiola"].ToString();

            try
            {
                using (SqlCommand comando = new SqlCommand("CONSULTA_BITACORA", objConn))
                {
                    comando.CommandType = CommandType.StoredProcedure;

                DataBase.abrirConexion(objConn);

                SqlDataReader rdr = comando.ExecuteReader();

                while (rdr.Read())
                {
                    bit.codigo_bit = rdr["codigo_bit"].ToString();

                    bit.fecha_hora = Convert.ToDateTime(rdr["fecha_hora"]);

                    bit.descripcion = rdr["descripcion"].ToString();
                }
                DataBase.cerrarConexion(objConn);
            } }
            catch (SqlException e)
            {
                Console.Write("ERROR: " + e.Message);
            }
            return bit;
        }
        }
    }