using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Bases2
{
    public class Procedures
    {
        public static List<Tuple<int, string>> getProvincias()
        {
            SqlConnection con = new SqlConnection("Data Source=SQLMASTER\\SQLMASTER;Initial Catalog=Elecciones;Integrated Security=True");
            SqlCommand com = new SqlCommand("getProvincias", con);
            com.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapt = new SqlDataAdapter(com);
            DataTable dataset = new DataTable();
            adapt.Fill(dataset);
            List <Tuple<int, string>> provincias = new List<Tuple<int, string>>();

            foreach (DataRow row in dataset.Rows)
            {
                int IDProvincia = int.Parse(row["IDProvincia"].ToString());
                string Nombre = row["Nombre"].ToString();
                Tuple<int, string> provincia = Tuple.Create(IDProvincia, Nombre);
                provincias.Add(provincia);
            }
            return provincias;
        }
    }
}