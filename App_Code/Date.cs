using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


//Breakes down dates from the database into years months and day so that they can be changed individually

public class Date
{
    public string month;
    public int day;
    public int year;
    //Default constructor
    public Date(String Mh, int Dy, int yr)
    {
        month = Mh;
        day = Dy;
        year = yr;
    }

    public Date()
    {
    }

    //Converts the date into a string
    public override string ToString()
    {
        string date;
        date = month + day.ToString() + ", " +/*year*/ year.ToString();
        return date;
    }
    Date toDate(string z)
    {
        Date x = new Date();
        string m = z.Substring(0, z.IndexOf(' '));
        int d = Convert.ToInt32(z.Substring(z.IndexOf(' ') + 1, z.LastIndexOf(' ')));

        x.month = m;
        return x;
    }
}
