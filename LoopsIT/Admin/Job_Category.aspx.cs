﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoopsIT.Admin
{
    public partial class Job_Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddCategoryButton_Click(object sender, EventArgs e)
        {
            CategorySQL.Insert();
            CategoryNameTextBox.Text = "";
        }
    }
}