using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Node
/// </summary>
public class Node
{
   
    public string name { set; get; }
    public int number { set; get; }
    public int pID { set; get; }
    public int fID { set; get; }
    public string answer { set; get; }

    public Node()
    {

    }
    public Node(string n, int num,int PID,int FID)
    {
        name = n;
        number = num;
        pID = PID;
        fID = FID;
    }
    
}