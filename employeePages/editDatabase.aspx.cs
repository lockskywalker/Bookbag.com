using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;

public partial class employeePages_editDatabase : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter adapt;
    DataView tbl;
    protected string pid;

    protected void ListView1_ItemInserted(object sender, ListViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occurred.<br /><br />" +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
    }

    protected void AccountsGrid_ItemInserted(object sender, ListViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occurred.<br /><br />" +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
    }

    protected void InvoicesGrid_ItemInserted(object sender, ListViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occurred.<br /><br />" +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string ddlsel;

        DataView prod = (DataView)productsource.Select(DataSourceSelectArguments.Empty);
        DataRowView row = (DataRowView)prod[prod.Count - 1];
        int x = Convert.ToInt32(row["productID"].ToString());
        x++;
        pid = x.ToString();

        ddlsel = editddl.SelectedItem.Text;
        ProductsGrid.Visible = true;
        AccountsGrid.Visible = false;
        InvoicesGrid.Visible = false;
        if (!IsPostBack)
        {

        }
    }

    protected void editddl_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void InvoicesGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    //Submit new entry into the database
   
    protected void refresh_Click(object sender, EventArgs e)
    {
        if (IsPostBack && editddl.Text == "Products")
        {
          
            ProductsGrid.Visible = true;
        }
        else if (IsPostBack && editddl.Text != "Products")
        {
            ProductsGrid.Visible = false;
           
        }


        if (IsPostBack && editddl.Text == "Accounts")
        {

            AccountsGrid.Visible = true;

        }
        else if (IsPostBack && editddl.Text != "Accounts"){
            AccountsGrid.Visible = false;
        }


        if (IsPostBack && editddl.Text == "Invoices")
        {

            InvoicesGrid.Visible = true;
        }
        else if (IsPostBack && editddl.Text != "Invoices"){
            InvoicesGrid.Visible = false;
        }
    }
}