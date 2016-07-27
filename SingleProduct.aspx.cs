using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.Web.Configuration;

public partial class SingleProduct : System.Web.UI.Page
{

    Item item = new Item();
    int qty, cartQty;
    ArrayList qtys = new ArrayList();
    ArrayList bookTypes = new ArrayList();
    string id;
    decimal price, dif;
    double precentage;
    bool qtyChanged = false;
    public void Page_Load(object sender, EventArgs e)
    {

        DataView tbl = (DataView)singleProductSource.Select(DataSourceSelectArguments.Empty);
        //this executes if the try to come to this page without going through the products page

        if (tbl == null)
        {
            Response.Redirect("products.aspx");
        }
        else {
            DataRowView row = (DataRowView)tbl[0];
            id = item.productId = row["productID"].ToString();
            namelbl.Text = item.productName = row["productName"].ToString();
            Page.Title += namelbl.Text;
            item.imageURL = row["imageURL"].ToString();
            shortlbl.Text = item.shortDescrip = row["shortDescription"].ToString();
            longlbl.Text = item.longDescrip = row["longDescription"].ToString();
            item.author = arthorlbl.Text = row["Author"].ToString();
            price = Convert.ToDecimal(row["Price"].ToString());
          
            //Used to see if the product is a book
            DataView subtbl = (DataView)subDB.Select(DataSourceSelectArguments.Empty);
            subtbl.RowFilter = "subCategoryID = '" + row["subCategoryID"].ToString() + "'";
            productImage.ImageUrl = WebConfigurationManager.AppSettings["imageURL"] + item.imageURL;
            if (subtbl.Count != 0)
            {

                DataRowView subRow = subtbl[0];
                //Checks if it is in the book category
                if (Convert.ToInt32(subRow["categoryID"].ToString()) == 10000)
                {
                    //Needed to get the quantity of books and the types
                    DataView bookTbl1 = (DataView)book.Select(DataSourceSelectArguments.Empty);
                    bookTbl1.RowFilter = "productID = '" + id + "'";
                    if (bookTbl1.Count != 0)
                    {
                        arthorlbl.Visible = true;
                        typeDDL.Visible = true;
                        typeLbl.Visible = true;
                        for (int i = 0; i < bookTbl1.Count; i++)
                        {
                            DataRowView bookRow = (DataRowView)bookTbl1[i];
                            //adds the quantities 
                            qtys.Add(bookRow["Quantity"].ToString());
                            //adds the type id
                            bookTypes.Add(bookRow["TypeID"].ToString());
                        }
                        for (int j = 0; j < bookTypes.Count; j++)
                        {
                            //takes the values coded into the web.config file and adds them to the type Drop Down list
                            string type = WebConfigurationManager.AppSettings[bookTypes[j].ToString()];
                            typeDDL.Items.Add(type);
                        }
                        qty = Convert.ToInt32(qtys[typeDDL.SelectedIndex]);
                    }
                    else
                    {
                        qty = Convert.ToInt32(row["Quantity"]);

                    }
                }
                else
                {
                    qty = Convert.ToInt32(row["Quantity"]);

                }
            }
            if (qty < 1)
            {
                outofstocklbl.Visible = true;
                qtyLbl.Visible = false;
                qtyddl.Visible = false;
                btnAdd.Enabled = false;
            }
            else {

                fillQty(qtyddl, qty);
            }
        }
        if (!IsPostBack)
        {
            pricelbl.Text = price.ToString("C2");
        }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {

        
        item.qty = Convert.ToInt32(qtyddl.SelectedItem.Text);
        if (typeDDL.Visible == true)
        {
            DataView typeTbl = (DataView)types.Select(DataSourceSelectArguments.Empty);
            typeTbl.RowFilter = "typeID = '" + bookTypes[typeDDL.SelectedIndex] + "'";
            DataRowView typeRow = (DataRowView)typeTbl[0];
            precentage = Convert.ToDouble(typeRow["Precentage"]);
            if (precentage != 0)
            {
                precentage = precentage / 100;
                dif = price * (decimal)precentage;
                price += dif;
            }
        }
        item.price = Convert.ToDecimal(pricelbl.Text.Substring(1));



        HttpCookie cart;
        string id = (string)Session["userNamelabel"];
        cart = Request.Cookies["cart" + id];
        if (cart == null)
        {
            cart = new HttpCookie("cart" + id);
            Response.Cookies.Add(cart);
        }
        int itemNum = Convert.ToInt32(cart.Values["ItemCount"]);
        itemNum++;
        cart.Values.Add("item:" + itemNum.ToString(), item.ToString());
        cart.Values["ItemCount"] = (itemNum.ToString());
        if (id == "guest" || id == null)
            cart.Expires = DateTime.Now.AddHours(2);
        else
            cart.Expires = DateTime.Now.AddMonths(2);
        Response.SetCookie(cart);
        Response.Redirect("cart.aspx");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        qtyChanged = true;
        cartQty = Convert.ToInt32(qtyddl.SelectedItem.Text.ToString());
    }
    protected void typeDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        int sel = typeDDL.SelectedIndex;
        qtyddl.Items.Clear();
        qty = Convert.ToInt32(qtys[typeDDL.SelectedIndex]);
        if (qty < 1)
        {
            outofstocklbl.Visible = true;
            qtyddl.Visible = false;
        }
        else {

            fillQty(qtyddl, qty);
        }
        typeDDL.Items.Clear();
        for (int j = 0; j < bookTypes.Count; j++)
        {
            //takes the values coded into the web.config file and adds them to the type Drop Down list
            string type = WebConfigurationManager.AppSettings[bookTypes[j].ToString()];
            typeDDL.Items.Add(type);
        }
        typeDDL.SelectedIndex = sel;
        DataView typeTbl = (DataView)types.Select(DataSourceSelectArguments.Empty);
        typeTbl.RowFilter = "typeID = '" + bookTypes[typeDDL.SelectedIndex] + "'";
        DataRowView typeRow = (DataRowView)typeTbl[0];
        precentage = Convert.ToDouble(typeRow["Precentage"]);
        if (precentage != 0)
        {
            precentage = precentage / 100;
            dif = price * (decimal)precentage;
            price += dif;
        }
        pricelbl.Text = price.ToString("C2");
    }
    private void fillQty(DropDownList x, int amount)
    {
        for (int i = 1; i <= amount; i++)
        {
            x.Items.Add(i.ToString());
        }
    }
}