using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Data;

public partial class OwnControls_OpinionControl : System.Web.UI.UserControl
{
    private static Image quotation;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public OwnControls_OpinionControl() { }

    public OwnControls_OpinionControl(string opinion, string user, string rat)
        {
            Panel OpinionPanel = new Panel();
            Panel UserPanel = new Panel();

            OpinionPanel.CssClass = "RandOpinionDesc";
            quotation = new Image();
            quotation.ImageUrl = "../images/quot1.gif";
            quotation.Attributes.Add("style", "margin-right: 10px;");
            OpinionPanel.Controls.Add(quotation);
            OpinionPanel.Controls.Add(new LiteralControl(opinion));
            quotation = new Image();
            quotation.ImageUrl = "../images/quot1.gif";
            quotation.Attributes.Add("style", "margin-left: 15px;");
            OpinionPanel.Controls.Add(quotation);
            UserPanel.CssClass = "RandOpinionAuthor";

            Table table = new Table();
            table.CellSpacing = 50;
            table.Rows.Add(new TableRow());
            // First column
            TableCell cell = new TableCell();
            cell.Controls.Add(new LiteralControl(user));
            table.Rows[0].Cells.Add(cell);
            // Second column
            cell = new TableCell();
            Rating rating = new Rating();
            rating.CssClass = "rating";
            rating.ID = "Rating1";
            rating.MaxRating = 5;
            rating.CurrentRating = Int32.Parse(rat);
            rating.StarCssClass = "starRating";
            rating.FilledStarCssClass = "filledStarRating";
            rating.EmptyStarCssClass = "emptyStarRating";
            rating.WaitingStarCssClass = "waitingStarRating";
            rating.ReadOnly = true;
            cell.Controls.Add(rating);
            table.Rows[0].Cells.Add(cell);
            UserPanel.Controls.Add(table);

            this.Controls.Add(OpinionPanel);
            this.Controls.Add(UserPanel);
        }
}