using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bases2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonServer_Click(object sender, EventArgs e)
        {
            int selection = DropDownListMotor.SelectedIndex;
            Consulta.database = selection;
            Persona persona = new Persona("117500613", "Rubén", "González", "Villanueva", "Masculino", new DateTime(1999,8,2),"123","40301",4, "Heredia","Santo Domingo", "San Vicente");
            Consulta.persona = persona;
            Server.Transfer("Consulta.aspx", true);
        }
    }
}