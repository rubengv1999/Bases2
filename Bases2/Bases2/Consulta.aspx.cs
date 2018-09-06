using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bases2
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCedula_Click(object sender, EventArgs e)
        {
            PanelChange.Visible = true;
        }

        protected void DropDownListProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            String provincia = DropDownListProvincia.SelectedItem.Value;
            
        }
    }
}