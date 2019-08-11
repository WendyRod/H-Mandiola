using DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLL
{
    public class Bitacora
    {

        DataBase db = new DataBase();
        //public void BitacoraList()
        //{
        //    SqlConnection objConn = new SqlConnection();
        //    objConn.ConnectionString = ConfigurationManager.ConnectionStrings["H-Mandiola"].ToString();

        //    try
        //    {
        //        using (SqlCommand comando = new SqlCommand("CONSULTA_BITACORA", objConn))
        //        {
        //            comando.CommandType = CommandType.StoredProcedure;
        //            comando.Parameters.Add("@pCedula", SqlDbType.VarChar).Value = _cedula;
        //            comando.Parameters.Add("@pNombre", SqlDbType.VarChar).Value = _nombre;
        //            comando.Parameters.Add("@pApellido1", SqlDbType.VarChar).Value = _apellido1;
        //            comando.Parameters.Add("@pApellido2", SqlDbType.VarChar).Value = _apellido2;
        //            comando.Parameters.Add("@pCorreo", SqlDbType.VarChar).Value = _email;
        //            comando.Parameters.Add("@pUsuario", SqlDbType.VarChar).Value = _username;
        //            comando.Parameters.Add("@pClave", SqlDbType.VarChar).Value = _clave;
        //            comando.Parameters.Add("@pRol", SqlDbType.Int).Value = 4;
        //            comando.Parameters.Add("@pEstado", SqlDbType.Int).Value = 1;
        //            DataBase.abrirConexion(objConn);
        //            comando.ExecuteNonQuery();
        //            DataBase.cerrarConexion(objConn);
        //        }
        //    }
        //    catch (SqlException e)
        //    {
        //        Console.Write("ERROR: " + e.Message);
        //    }
        //}

        SqlConnection conn;
        string mensaje_error;
        int numero_error;
        string sp;
        DataSet ds;

        public DataSet carga_lista_bitacora()
        {
            //conexion = cls_DAL.trae_conexion("H-Mandiola", ref mensaje_error, ref numero_error);
            conn = DataBase.getConexion("H-Mandiola");
            if (conn == null)
            {
                //insertar en la table de errores
                //HttpContext.Current.Response.Redirect("Error.aspx?error=" + numero_error.ToString() + "&men=" + mensaje_error);
                return null;
            }
            else
            {
                sp = "CONSULTA_BITACORA";
                ds = DataBase.ejecuta_dataset(conn, sp, true, ref mensaje_error, ref numero_error);
                //ds = cls_DAL.ejecuta_dataset(conexion, sql, true, ref mensaje_error, ref numero_error);


                return ds;

            }
        }


    }
}
