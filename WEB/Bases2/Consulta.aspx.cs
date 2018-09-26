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
            persona = Procedures.getPerson(TextBoxCedula.Text);
            List<Tuple<int, string>> provincias = Procedures.getProvincias();
            DropDownListProvincia.Items.Clear();
            foreach ( Tuple<int, string> provincia in provincias)
            {
                int IDProvincia = provincia.Item1;
                string Provincia = provincia.Item2;
                DropDownListProvincia.Items.Add(new ListItem(Provincia, IDProvincia.ToString()));
            }
            
            PanelChange.Visible = true;
            TextBoxUbicacion.Text = persona.Provincia + ", " + persona.Canton + ", " + persona.Distrito;
            TextBoxNombre.Text = persona.Nombre;
            TextBoxPrimerApellido.Text = persona.Apellido1;
            TextBoxSegundoApellido.Text = persona.Apellido2;
            if (persona.Sexo == 1)
            {
                RadioButtonListSexo.SelectedIndex= 0;
            }
            else
            {
                RadioButtonListSexo.SelectedIndex = 1;
            }
            CalendarCaducacion.SelectedDate = persona.FechaCaducacion.Date;
            TextBoxJunta.Text = persona.CodigoJunta;
        }

        protected void DropDownListProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            String IDprovincia = DropDownListProvincia.SelectedItem.Value;
            List<Tuple<int, string>> cantones = Procedures.getCantones(IDprovincia);
            DropDownListCanton.Items.Clear();
            foreach (Tuple<int, string> canton in cantones)
            {
                int IDCanton = canton.Item1;
                string Canton = canton.Item2;
                DropDownListCanton.Items.Add(new ListItem(Canton, IDCanton.ToString()));
            }
        }

        protected void DropDownListCanton_SelectedIndexChanged(object sender, EventArgs e)
        {
            String IDCanton = DropDownListCanton.SelectedItem.Value;
            List<Tuple<int, string>> distritos = Procedures.getDistritos(IDCanton);
            DropDownListDistrito.Items.Clear();
            foreach (Tuple<int, string> distrito in distritos)
            {
                int IDDistrito = distrito.Item1;
                string Distrito = distrito.Item2;
                DropDownListDistrito.Items.Add(new ListItem(Distrito, IDDistrito.ToString()));
            }
        }
    }
}