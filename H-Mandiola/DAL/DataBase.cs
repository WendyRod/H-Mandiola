using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public class DataBase
    {
        
        //private static string error;

        public static SqlConnection getConexion(string nombre_conexion)
        {
            SqlConnection objConexion;
            try
            {
                string cadConexion = "";

                cadConexion = ConfigurationManager.ConnectionStrings[nombre_conexion].ToString();
                objConexion = new SqlConnection(cadConexion);
                return objConexion;
            } catch(Exception e)
            {
                Console.Write(e.Message);
                return null;
            }
        }

        public static void abrirConexion(SqlConnection conexion)
        {
            try
            {
                conexion.Open();
                Console.Write("Conexion exitosa");
            }
            catch (SqlException e)
            {
                Console.Write("No se pudo conectar" + e);
            }
        }

        public static void cerrarConexion(SqlConnection conexion)
        {
            if(conexion != null)
            {
                conexion.Close();
            }
        }

        public static DataSet ejecuta_dataset(SqlConnection conexion, string sql, bool storedP, ref string mensaje_error, ref int numero_error)
        {
            SqlDataAdapter sql_data_adapter;
            DataSet dataset = new DataSet();
            try
            {
                sql_data_adapter = new SqlDataAdapter(sql, conexion);
                if (storedP)
                {
                    sql_data_adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                }
                sql_data_adapter.Fill(dataset);
                numero_error = 0;
                mensaje_error = "OK!";
                return dataset;
            }
            catch (SqlException ex)
            {
                numero_error = ex.Number;
                mensaje_error = ex.Message;
                return null;
            }
        }

        public DataBase() { }

        /*string cadena = "Data Source=localhost\\SQLEXPRESS; Initial Catalog=H-Mandiola; Integrated Security=True";
        public SqlConnection coneccion = new SqlConnection();

        public conexion()
        {
            coneccion.ConnectionString = cadena;
        }

        public void abrir()
        {
            try
            {
                coneccion.Open();
                Console.WriteLine("Conexion abierta");
            }
            catch(Exception e)
            {
                Console.WriteLine("Error al abrir la BD" + e.Message);
            }
        }

        public void Cerrar()
        {
            conexion.Close();
        }

        //Devuelve una lista de objetos en la que se almacenan todas las entidades de la tabla
        //junto con sus datos.
        public List<object> ObtenerTabla(string tabla, int columnasTabla)   //ColumnasTabla se refiere a la cantidad de atributos que posee esa tabla.
        {
            //Instrucción.
            string p_cadena = "SELECT * FROM " + tabla + ";";

            //Lista de objetos a devolver.
            List<object> entidades = new List<object>();

            try
            {
                SqlCommand comando = new SqlCommand(p_cadena, conexion);
                SqlDataReader lector = comando.ExecuteReader();

                //Datos que se almacenan en la tabla.
                List<string> datos = new List<string>();

                //Recorre todos los datos de la tabla.
                while (lector.Read())
                {
                    //Limpia los datos anteriores.
                    datos.Clear();

                    for (int cont = 0; cont < columnasTabla; cont++)
                    {
                        //Agrega el valor de cada una de las columnas.
                        datos.Add(lector.GetValue(cont).ToString());
                    }

                    entidades.Add(datos);
                }

                return entidades;
            }
            catch (Exception ex)
            {
                //Incluir error.
                return null;
            }
        }

        //Devuelve una lista de objetos que coincidan con la condición que se pide.
        public List<object> BuscarEnTabla(string tabla, int columnasTabla, string parametroCondicion, string valorCondicion)
        {
            //Instrucción. SELECT [parametro] FROM [tabla] WHERE [parametroCondicion] == [valorCondicion]
            string p_cadena = "SELECT * FROM " + tabla + " WHERE " + tabla + "." + parametroCondicion + "=" + valorCondicion + ";";

            //Lista de objetos a devolver.
            List<object> entidades = new List<object>();

            try
            {
                SqlCommand comando = new SqlCommand(p_cadena, conexion);
                SqlDataReader lector = comando.ExecuteReader();

                //Datos que se almacenan en la tabla.
                List<string> datos = new List<string>();

                //Recorre todos los datos de la tabla.
                while (lector.Read())
                {
                    //Limpia los datos anteriores.
                    datos.Clear();

                    for (int cont = 0; cont < columnasTabla; cont++)
                    {
                        //Agrega el valor de cada una de las columnas.
                        datos.Add(lector.GetValue(cont).ToString());
                    }

                    //Agrega la entidad a la lista.
                    entidades.Add(datos);
                }

                return entidades;
            }
            catch (Exception e)
            {
                //Incluir error.
                return null;
            }
        }

        public void Crear(string tabla, string[] atributos)
        {
            //p_cadena queda: INSERT INTO [tabla] VALUES (atributos).

            string p_cadena = "INSERT INTO " + tabla + " VALUES (";

            //Recorre el array de atributos para generar una instrucción.
            foreach (string atributo in atributos)
            {
                p_cadena += atributo + ", ";
            }

            p_cadena += ");";

            SqlCommand comando = new SqlCommand(p_cadena, conexion);

            //Para ejecutar el comando creado arriba.
            comando.ExecuteNonQuery();
        }

        public void Eliminar()
        {

        }*/
    }
}
