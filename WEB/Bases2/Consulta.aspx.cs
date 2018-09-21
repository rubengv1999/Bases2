using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bases2
{
    public partial class Consulta : Page
    {
        public static int database;
        public static Persona persona;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (database == 0)
            {
                LabelDatabase.Text = "Usted está usando el motor de base de datos de SQL Server";
            }
            else
            {
                LabelDatabase.Text = "Usted está usando el motor de base de datos de Oracle";
            }


        }

        protected void ButtonCedula_Click(object sender, EventArgs e)
        {
            PanelChange.Visible = true;
            TextBoxNombre.Text = persona.Nombre;
            TextBoxPrimerApellido.Text = persona.Apellido1;
            TextBoxSegundoApellido.Text = persona.Apellido2;
            if (persona.Sexo == "Masculino")
            {
                DropDownListSexo.SelectedIndex = 0;
            }
            else
            {
                DropDownListSexo.SelectedIndex = 1;
            }
            CalendarCaducacion.SelectedDate = persona.FechaCaducacion.Date;
            
            TextBoxJunta.Text = persona.CodigoJunta;
            DropDownListProvincia.SelectedIndex = persona.IDProvincia-1;
        }

        protected void DropDownListProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            String provincia = DropDownListProvincia.SelectedItem.Value;
            
        }
    }
}