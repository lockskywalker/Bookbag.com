using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


/* The linked list is used to retrieve and store information from the database and 
    
*/
public class LinkList
{
    public List<Node> head;
    public LinkList()
    {
        head = new List<Node>();
    }
    public int size()
    {
       return head.Count;
    }
    
    public override string ToString()
    {
        string info = "";
        for (int x = 1; x <= head.Count; x++)
        {
            info += "Name: " + head[x].name+ " preferenceID: " + head[x].pID.ToString() + " foreginID: " +
                    head[x].fID.ToString() + "postion in the list:" + head[x].number.ToString() + "; ";
        }
        return info;
    }
   
}