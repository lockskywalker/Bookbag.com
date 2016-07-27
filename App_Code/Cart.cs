using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cart
/// </summary>
public class Cart
{

    public List<Item> Items;
    public int Count
    {
        get { return Items.Count; }
    }
    public Pricing prices;
    public Cart()
    {
        Items = new List<Item>();
        prices = new Pricing();
        prices.shippingPrice = 0;
        prices.subtotal = 0;
        prices.tax = 0;
        prices.total = 0;
    }
    public override string ToString()
    {
        string items = "";

        foreach (var item in Items)
        {
            items += item.ToString() + ";";
        }
        return items;
    }
    public Cart getCart(string username)
    {
        HttpCookie kartCookie;
        kartCookie = HttpContext.Current.Request.Cookies["cart" + username];
        if (kartCookie != null)
        {
            string subT, Tax, Total, Count, shipCost;
            subT = kartCookie.Values.Get("Subtotal");
            Tax = kartCookie.Values.Get("tax");
            Total = kartCookie.Values.Get("total");
            Count = kartCookie.Values.Get("ItemCount");
            shipCost = kartCookie.Values.Get("shippingPrice");
            prices.tax = Convert.ToDecimal(Tax);
            prices.total = Convert.ToDecimal(Total);
            prices.subtotal = Convert.ToDecimal(subT);
            prices.shippingPrice = Convert.ToDecimal(shipCost);
            for (int x = 1; x <= Convert.ToInt32(Count); x++)
            {
                toCart(kartCookie.Values["item:" + x.ToString()].ToString());
            }
        }
        return this;
    }
    public void Add(Item item)
    {
        bool same = false;
        int pos = 0;
        if (Items.Count < 1)
        {
            Items.Add(item);
        }
        else {
            for (int i = 0; i < Items.Count; i++)
            {
                if (item.productId == Items[i].productId)
                {
                    same = true;
                    pos = i;
                }

            }
            if (same == true)
            {
                Items[pos].qty += item.qty;
            }
            else
            {
                Items.Add(item);
            }
        }
    }
    public Cart toCart(string z)
    {
        Item kartItem = new Item();
        kartItem.toItem(z);
        Add(kartItem);
        return this;

    }

    public Cart deleteAll()
    {
        Items.Clear();
        return this;
    }
    public Cart deleteSelected(List<int> postions)
    {
        for (int i = postions.Count - 1; i >= 0; i--)
        {
            Items.RemoveAt(postions[i]);
        }
        return this;
    }

    public string Display()
    {
        return ToString();
    }
    public Cart deleteSelected(int i)
    {
        Items.RemoveAt(i);
        return this;
    }
    public Cart getItem(int i)
    {
        Cart singleItem = new Cart();
        singleItem.Add(Items[i]);
        return singleItem;
    }
    public HttpCookie toCookie(string username)
    {
        HttpCookie cookie = new HttpCookie("cart" + username);
        cookie.Values["ItemCount"] = Items.Count.ToString();
        cookie.Values.Add("Subtotal", prices.subtotal.ToString());
        cookie.Values.Add("tax", prices.tax.ToString());
        cookie.Values.Add("total", prices.total.ToString());
        cookie.Values.Add("shippingPrice", prices.shippingPrice.ToString());
        for (int i = 1; i < Items.Count; i++)
        {
            cookie.Values.Add("item:" + i.ToString(), Items[i].ToString());
            cookie.Expires = DateTime.Now.AddMonths(2);
        }

        return cookie;
    }

}