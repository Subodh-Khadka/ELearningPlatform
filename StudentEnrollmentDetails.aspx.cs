using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELearningPlatform
{
    public partial class StudentEnrollmentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void slist(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex >= 0)
            {
                string selectedStudentID = DropDownList1.SelectedValue;
                studentEnrollmentQuery.SelectCommand = @"SELECT s.STUDENTNO, s.STUDENTNAME, s.CONTACT, s.DOB, s.EMAILADDRESS, s.COUNTRY, e.ENROLLDATE, c.COURSEID, c.COURSETITLE 
            FROM STUDENT s
            INNER JOIN ENROLLMENT e ON s.STUDENTNO = e.STUDENTNO
            INNER JOIN COURSE c ON e.COURSEID = c.COURSEID
            WHERE s.STUDENTNO = :SelectedStudentID";

                studentEnrollmentQuery.SelectParameters.Clear();
                studentEnrollmentQuery.SelectParameters.Add("SelectedStudentID", selectedStudentID);
            }
            else
            {
                studentEnrollmentQuery.SelectCommand = @"SELECT s.STUDENTNO, s.STUDENTNAME, s.CONTACT, s.DOB, s.EMAILADDRESS, s.COUNTRY, e.ENROLLDATE, c.COURSEID, c.COURSETITLE 
            FROM STUDENT s, ENROLLMENT e, COURSE c 
            WHERE s.STUDENTNO = e.STUDENTNO AND e.COURSEID = c.COURSEID";
            }

            GridView1.DataBind();
        }

    }
}