using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;


//Cretes custom drop down lists

public class customDDL
{
    String[] States = new String[] {"WA","HI","AK","OR","CA","ID","NV","UT","AZ","MT","WY","CO",//12
             "NM","TX","OK","KS","NE","SD","ND","MN","IA","MO","AR","LA","MS","TN","KY","IN","MI","OH",//18
             "WV","VA","NC","SC","GA","FL", "DC","MD","DE","WI","NJ","CT","RI","MA","PA","VT", "NH","NY",//18
             "ME","AL","IL"};
    String[] months = new String[]
    {"01 January","02 February","03 March", "04 April", "05 May","06 June","07 July", "08 August",
            "09 September", "10 October", "11 November", "12 December "
    };
    String[] tables = new String[] { "Customer", "Customer Card Information","Book","Product Information",
                                            "Invoices", "Purchases","Product","Categories","Sub-Categories", "Services",
                                            "Subscriptions","Department","Employee"};
    public customDDL()
    {

    }
    //creates a drop down list of the states in decending order
    public DropDownList setStates(DropDownList y)
    {
        Array.Sort(States);
        for (int i = 0; i < States.Length; i++)
        {
            y.Items.Add(States[i]);
        }
        return y;
    }
    //A drop down list of months
    public DropDownList setMonth(DropDownList x)
    {
        for (int i = 0; i < 12; i++)
        {
            x.Items.Add(months[i]);
        }
        return x;
    }
    public DropDownList setCardMonth(DropDownList month)
    {
        month.Items.Add(" ");
        for (int i = 0; i < 12; i++)
        {
            month.Items.Add(months[i].Substring(0,2));
        }

        return month;
    }
    //A drop down list box that generates a list from 1 to number
    //used for generating the qty ddl
    public DropDownList setItems(int number)
    {
        DropDownList z = new DropDownList();
        for (int i = 1; i < number; i++)
        {
            z.Items.Add(i.ToString());
        }
        return z;
    }
    //Genertes a list of years
    public DropDownList setYearRange(DropDownList years)
    {

        for (int styr = (DateTime.Now.Year - 100); styr < DateTime.Now.Year; styr++)
        {
            years.Items.Add(styr.ToString());
        }
        return years;
    }
    //ddl for credit card year
    public DropDownList setCardYear(DropDownList cd)
    {
        int styr,year;
        string yr;
        yr = DateTime.Now.Year.ToString();
        year = Convert.ToInt32(yr.Substring(2));
        cd.Items.Add(" ");
        for (styr = year ; styr <= (year + 5); styr++)
        {
            cd.Items.Add(styr.ToString());
        }

        return cd;

    }
    //ddl to set the number of days per each month
    public DropDownList setDays(int month, int year, DropDownList days)
    {
        switch (month)
        {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                for (int z = 1; z <= 31; z++)
                {
                    days.Items.Add(z.ToString());
                }
                break;
            case 2:
                int leapYear;
                if (DateTime.IsLeapYear(year))
                {
                    leapYear = 29;
                }
                else
                {
                    leapYear = 28;
                }
                for (int z = 1; z <= leapYear; z++)
                {
                    days.Items.Add(z.ToString());
                }
                break;
            case 4:
            case 6:
            case 9:
            case 11:
                for (int z = 1; z < 31; z++)
                {
                    days.Items.Add(z.ToString());
                }
                break;
        }
        return days;
    }
    //ddl selects the cities deom the database that correnspond to the selected state


    public DropDownList selectTable(int numToAdd)
    {
        DropDownList tableSelectDDL = new DropDownList();
        for (int i = 0; i <= numToAdd; i++)
        {
            tableSelectDDL.Items.Add(tables[i]);
        }
        return tableSelectDDL;
    }

}
