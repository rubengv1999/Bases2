using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bases2
{
    public class Persona
    {
        public String Cedula;
        public String Nombre;
        public String Apellido1;
        public String Apellido2;
        public int Sexo;
        public DateTime FechaCaducacion;
        public String CodigoJunta;
        public String Provincia;
        public String Canton;
        public String Distrito;

        public Persona(string cedula, string nombre, string apellido1, string apellido2, int sexo, DateTime fechaCaducacion, string codigoJunta, string provincia, string canton, string distrito)
        {
            Cedula = cedula;
            Nombre = nombre;
            Apellido1 = apellido1;
            Apellido2 = apellido2;
            Sexo = sexo;
            FechaCaducacion = fechaCaducacion;
            CodigoJunta = codigoJunta;
            Provincia = provincia;
            Canton = canton;
            Distrito = distrito;
        }
    }
}