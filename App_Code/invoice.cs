using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for invoice
/// </summary>
public class invoice
{   
    public string header { get; set; }
    public Cart kart;
    public Pricing pricing { get; set; }
    public string footer { get; set; }
    public invoice()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}