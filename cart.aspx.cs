using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cart : System.Web.UI.Page
{
    public Cart kartItems = new Cart();
    List<int> x = new List<int>();
    List<int> a = new List<int>();
    decimal zero = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        string username = (string)Session["userNamelabel"];
        kartItems.getCart(username);
        if (!IsPostBack){
            CartList.DataSource = kartItems.Items;
            CartList.DataBind();
            if (kartItems.Items.Count != 0)
            {
                setTableLabel();
            }
        }
    }
    
    protected void deleteSelectedBttn_Click(object sender, EventArgs e)
    {
        // needs testing
        List<int> pos = new List<int>();
        for (int i = 0; i < CartList.Rows.Count; i++)
        { 
            if (((CheckBox)CartList.Rows[i].FindControl("selectCheckBox")).Checked == true)
            { 
                pos.Add(i);
            }
        }
        kartItems.deleteSelected(pos);
        updateCookie();
        CartList.DataSource = kartItems.Items;
        CartList.DataBind();
        setTableLabel();

    }
    protected void deleteAllBttn_Click(object sender, EventArgs e)
    {
        kartItems.deleteAll();
        updateCookie();
        CartList.DataSource = kartItems.Items;
        CartList.DataBind();
        subtotalLbl.Text = totalLbl.Text = taxLbl.Text = zero.ToString("c");
        

    }
    protected void continShopBttn_Click(object sender, EventArgs e)
    {
        Response.Redirect("products.aspx");
    }
    protected void orderBttn_Click(object sender, EventArgs e)
    {
        //kartItems.getCart((string)Session["userNamelabel"]);
        updateCookie();
        Response.Redirect("order.aspx");
    }
    private decimal getSubtotal()
    {
        decimal subtotal=0;
        for(int i = 0; i < kartItems.Count; i++)
        {
            subtotal += kartItems.Items[i].productTotal;
        }
        return subtotal;
    }
    private void setTableLabel()
    {
        decimal tax, subtotal, total;
        kartItems.prices.subtotal=subtotal =getSubtotal();
        kartItems.prices.tax= tax = subtotal * Convert.ToDecimal(WebConfigurationManager.AppSettings["tax"]);
        kartItems.prices.total= total = subtotal + tax;
        subtotalLbl.Text = subtotal.ToString("c");
        taxLbl.Text = tax.ToString("c");
        totalLbl.Text = total.ToString("c");
    }
    private void updateCookie()
    {
        HttpCookie cartCookie = Request.Cookies["cart" + (string)Session["userNamelabel"]];
        string id = (string)Session["userNamelabel"];
        decimal tax, subtotal, total;
        subtotal = getSubtotal();
        tax = subtotal * Convert.ToDecimal(WebConfigurationManager.AppSettings["tax"]);
        total = subtotal + tax;
        if (cartCookie == null)
        {
            cartCookie = new HttpCookie("cart" + (string)Session["userNamelabel"]);
            Response.Cookies.Add(cartCookie);
        }
        cartCookie.Value = null;
        cartCookie.Values["ItemCount"] = kartItems.Count.ToString();
        cartCookie.Values["Subtotal"] = subtotal.ToString();
        cartCookie.Values["tax"] = tax.ToString();
        cartCookie.Values["total"] = total.ToString();
        for (int x = 1; x <= kartItems.Count; x++)
        {
            cartCookie.Values.Add("item:" + x.ToString(), kartItems.Items[x - 1].ToString());
        }
        if (id == "guest" || id == null)
            cartCookie.Expires = DateTime.Now.AddHours(2);
        else
            cartCookie.Expires = DateTime.Now.AddMonths(2);
        Response.SetCookie(cartCookie);
    }
    protected void qtyDDL_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}