using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELearningPlatform
{
    public partial class PopularCourseDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void clist(object sender, EventArgs e)
        {
            string selectedMonth = CustomDropDownList.SelectedValue;
            if (!string.IsNullOrEmpty(selectedMonth))
            {
                SqlDataSource1.SelectCommand = @"
           SELECT * FROM (
                    SELECT e.COURSEID, c.COURSETITLE, COUNT(e.STUDENTNO) AS ENROLLMENT_COUNT
                    FROM enrollment e
                    JOIN course c ON e.COURSEID = c.COURSEID
                    WHERE EXTRACT(MONTH FROM e.ENROLLDATE) = :selectedMonth
                    GROUP BY e.COURSEID, c.COURSETITLE
                    ORDER BY COUNT(e.STUDENTNO) DESC) 
            WHERE ROWNUM <= 3";

                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("selectedMonth", selectedMonth);
            }
            else
            {
            SqlDataSource1.SelectCommand = @"
           SELECT * FROM (
                    SELECT e.COURSEID, c.COURSETITLE, COUNT(e.STUDENTNO) AS ENROLLMENT_COUNT
                    FROM enrollment e
                    JOIN course c ON e.COURSEID = c.COURSEID
                    WHERE EXTRACT(MONTH FROM e.ENROLLDATE) = 1
                    GROUP BY e.COURSEID, c.COURSETITLE
                    ORDER BY COUNT(e.STUDENTNO) DESC) 
            WHERE ROWNUM <= 3";
            }
            GridView1.DataBind();
        }

    }
}
