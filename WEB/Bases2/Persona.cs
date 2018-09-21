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
        public int IDProvincia;
        public String Provincia;
        public int IDCanton;
        public String Canton;
        public int IDDistrito;
        public String Distrito;

        public Persona(string cedula, string nombre, string apellido1, string apellido2, int sexo, DateTime fechaCaducacion, string codigoJunta, int iDProvincia, string provincia, int iDCanton, string canton, int iDDistrito, string distrito)
        {
            Cedula = cedula;
            Nombre = nombre;
            Apellido1 = apellido1;
            Apellido2 = apellido2;
            Sexo = sexo;
            FechaCaducacion = fechaCaducacion;
            CodigoJunta = codigoJunta;
            IDProvincia = iDProvincia;
            Provincia = provincia;
            IDCanton = iDCanton;
            Canton = canton;
            IDDistrito = iDDistrito;
            Distrito = distrito;
        }
    }
}