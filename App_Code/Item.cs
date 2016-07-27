using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/*This represents a product in the cart
*/

public class Item
{
    public string productId { get; set; }
    public string productName { get; set; }
    public string author;
    public decimal price { get; set; }
    public string imageURL { get; set; }
    public string shortDescrip;
    public string longDescrip;
    public int qty { get; set; }

    public decimal productTotal
    {
        get
        {
            decimal i = price * qty;
            return i;
        }
        set
        {
            productTotal = price * qty;
        }
    }
    public Item()
    {

    }
    public override string ToString()
    {
        productName.Replace(' ', '%');
        return productId + " " + productName + " " + qty.ToString() + " " + price.ToString();
    }
    public void toItem(string x)
    {
        string mid;
        int first, second, third;
        first = x.IndexOf(' ');
        third = x.LastIndexOf(' ');
        productId = x.Substring(0, first);
        mid = x.Substring(first + 1, (third - first) - 1);
        int i = mid.Length;
        second = mid.LastIndexOf(' ');
        price = Convert.ToDecimal(x.Substring(third + 1));
        qty = Convert.ToInt32(mid.Substring(second + 1));
        productName = mid.Substring(0, second);
        productName.Replace('%', ' ');
    }
    public string Display()
    {
        string display;
        display = productName + qty.ToString() + price.ToString();
        return display;
    }
    public ListViewDataItem Display(int dataIndex, int displayIndex)
    {
        ListViewDataItem dataItem = new ListViewDataItem(dataIndex, displayIndex);


        return dataItem;
    }
    public decimal getTotal()
    {
        decimal total = (price * qty);
        return total;
    }
}