//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using DAL;
//using System.Data;
//using System.Data.SqlClient;
//using System.Configuration;

//namespace BLL
//{
//    public class Reserva
//    {
//        public void AgregaReserva()
//        {
//            bool result = true;
//            SqlConnection objConn = new SqlConnection();
//            objConn.ConnectionString = ConfigurationManager.ConnectionStrings["Mandiola"].ToString();

//            try
//            {
//                using (SqlCommand comando = new SqlCommand("INSERTA_RESERVA", objConn))
//                {
//                    comando.CommandType = CommandType.StoredProcedure;
//                    comando.Parameters.Add("@pFecha_Entrada", SqlDbType.VarChar).Value = _nombre;
//                    comando.Parameters.Add("@pFecha_Salida", SqlDbType.VarChar).Value = _apellido1;
//                    comando.Parameters.Add("@pCantidad_Dias", SqlDbType.VarChar).Value = _apellido2;
//                    comando.Parameters.Add("@pCodigo_Promocional", SqlDbType.VarChar).Value = _email;
//                    comando.Parameters.Add("@pCantidad_Niños", SqlDbType.VarChar).Value = _username;
//                    comando.Parameters.Add("@pMascota", SqlDbType.VarChar).Value = _clave;
//                    comando.Parameters.Add("@pMetodo_Pago", SqlDbType.Int).Value = 4;
//                    comando.Parameters.Add("@pPrecio", SqlDbType.Int).Value = 1;
//                    comando.Parameters.Add("@pUsuario", SqlDbType.Int).Value = "123";
//                    DataBase.abrirConexion(objConn);
//                    comando.ExecuteNonQuery();
//                    DataBase.cerrarConexion(objConn);
//                }
//            }
//            catch (SqlException e)
//            {
//                Console.Write("ERROR: " + e.Message);
//            }
//            if (result)
//            {
//                Console.WriteLine("Datos Ingresados correctamente");
//            }
//            else
//            {
//                Console.WriteLine("Los datos no se ingresaron");
//            }
//        }
//    }
//}
