using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class subscriptionPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        HttpCookie cookie = Request.Cookies["id"];
        if (cookie == null)
        {
            warningLbl.Visible = true;
            subscriptionsView.Visible = false;
        }
        else
        {
            if (!IsPostBack)
            {
                DataView tbl = (DataView)user.Select(DataSourceSelectArguments.Empty);
                if (tbl.Count != 0)
                {
                    DataRowView row = (DataRowView)tbl[0];
                    if (row["subscriptionID"] != null&&row["subscriptionID"].ToString()!="")
                    {
                        int userSubscription = Convert.ToInt32(row["subscriptionID"].ToString());
                        subscriptions.SelectCommand = "SELECT [subscriptionName], [rate], [Description] FROM [SubscriptionType] WHERE [subscriptionID] != '"
                            + userSubscription.ToString()+"'";
                        subscriptionsView.DataSource = subscriptions;
                        subscriptionsView.DataBind();

                    }
                    else
                    {
                        subscriptions.SelectCommand = "SELECT [subscriptionName], [rate], [Description] FROM [SubscriptionType]";
                        subscriptionsView.DataSource = subscriptions;
                        subscriptionsView.DataBind();
                    }
                }
            }
        }
    }

    protected void subName_Click(object sender, EventArgs e)
    {
        DataView tbl = (DataView)subscriptions.Select(DataSourceSelectArguments.Empty);
        tbl.RowFilter = "subscriptionName =" + sender.ToString();
        DataRowView row;
        if (tbl.Count != 0)
        {
            row = (DataRowView)tbl[0];
            user.InsertParameters["subscriptionID"].DefaultValue = row["subscriptionID"].ToString();
        }
    }


}