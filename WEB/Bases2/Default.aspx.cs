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
            Server.Transfer("Consulta.aspx");
        }
    }
}