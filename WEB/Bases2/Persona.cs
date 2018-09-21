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
        public String Sexo;
        public DateTime FechaCaducacion;
        public String CodigoJunta;
        public String Codelec;
        public int IDProvincia;
        public String Provincia;
        public String Canton;
        public String Distrito;

        public Persona(string cedula, string nombre, string apellido1, string apellido2, string sexo, DateTime fechaCaducacion, string codigoJunta, string codelec, int iDProvincia, string provincia, string canton, string distrito)
        {
            Cedula = cedula;
            Nombre = nombre;
            Apellido1 = apellido1;
            Apellido2 = apellido2;
            Sexo = sexo;
            FechaCaducacion = fechaCaducacion;
            CodigoJunta = codigoJunta;
            Codelec = codelec;
            IDProvincia = iDProvincia;
            Provincia = provincia;
            Canton = canton;
            Distrito = distrito;
        }
    }
}