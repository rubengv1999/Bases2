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
            SqlConnection con = new SqlConnection("Data Source=ecRhin.ec.tec.ac.cr\\Estudiantes;Initial Catalog=Elecciones;User=anobando;Password=anobando");
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
       
        public static List<Tuple<int, string>> getCantones(string IDProvincia)
        {
            SqlConnection con = new SqlConnection("Data Source=ecRhin.ec.tec.ac.cr\\Estudiantes;Initial Catalog=Elecciones;User=anobando;Password=anobando");
            SqlCommand com = new SqlCommand("getCantones", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add("@IDProvincia", SqlDbType.Int).Value = int.Parse(IDProvincia);
            con.Open();
            com.ExecuteNonQuery();
            SqlDataAdapter adapt = new SqlDataAdapter(com);
            DataTable dataset = new DataTable();
            adapt.Fill(dataset);
            List<Tuple<int, string>> cantones = new List<Tuple<int, string>>();
            foreach (DataRow row in dataset.Rows)
            {
                int IDCanton = int.Parse(row["IDCanton"].ToString());
                string Nombre = row["Nombre"].ToString();
                Tuple<int, string> canton = Tuple.Create(IDCanton, Nombre);
                cantones.Add(canton);
            }
            return cantones;
        }
        public static List<Tuple<int, string>> getDistritos(string IDCanton)
        {
            SqlConnection con = new SqlConnection("Data Source=ecRhin.ec.tec.ac.cr\\Estudiantes;Initial Catalog=Elecciones;User=anobando;Password=anobando");
            SqlCommand com = new SqlCommand("getDistritos", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add("@IDCanton", SqlDbType.Int).Value = int.Parse(IDCanton);
            con.Open();
            com.ExecuteNonQuery();
            SqlDataAdapter adapt = new SqlDataAdapter(com);
            DataTable dataset = new DataTable();
            adapt.Fill(dataset);
            List<Tuple<int, string>> distritos = new List<Tuple<int, string>>();
            foreach (DataRow row in dataset.Rows)
            {
                int IDDistrito = int.Parse(row["IDDistrito"].ToString());
                string Nombre = row["Nombre"].ToString();
                Tuple<int, string> distrito = Tuple.Create(IDDistrito, Nombre);
                distritos.Add(distrito);
            }
            return distritos;
        }
        public static Persona getPerson(string Cedula)
        {
            SqlConnection con = new SqlConnection("Data Source=ecRhin.ec.tec.ac.cr\\Estudiantes;Initial Catalog=Elecciones;User=anobando;Password=anobando");
            SqlCommand com = new SqlCommand("getPerson", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add("@Cedula", SqlDbType.Int).Value = int.Parse(Cedula);
            con.Open();
            com.ExecuteNonQuery();
            SqlDataAdapter adapt = new SqlDataAdapter(com);
            DataTable dataset = new DataTable();
            adapt.Fill(dataset);
            List<Persona> personas = new List<Persona>();
            foreach (DataRow row in dataset.Rows)
            {
                string Nombre = row["Nombre"].ToString();
                string Apellido1 = row["Apellido1"].ToString();
                string Apellido2 = row["Apellido2"].ToString();
                int Sexo = int.Parse(row["Sexo"].ToString());
                DateTime FechaCaducidad = DateTime.Parse( row["FechaCaducacion"].ToString());
                string CodigoJunta = row["CodigoJunta"].ToString();
                string Provincia = row["Provincia"].ToString();
                string Canton = row["Canton"].ToString();
                string Distrito = row["Distrito"].ToString();
                Persona persona = new Persona(Cedula, Nombre, Apellido1, Apellido2, Sexo, FechaCaducidad, CodigoJunta, Provincia, Canton, Distrito);
                personas.Add(persona);
            }
            return personas[0];
        }
    }
}