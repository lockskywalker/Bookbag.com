using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Pricing
/// </summary>
public class Pricing
{
    public decimal subtotal {get; set; }
    public decimal tax { get; set; }
    public decimal total { get; set; }
    public decimal shippingPrice { get; set; }
    public Pricing()
    {
        
    }
}