using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System;
using System.Web.UI.WebControls;

namespace ELearningPlatform
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind the GridView with initial data (all students)
                BindGridView("");
            }
        }

        protected void btnSearchStudent_Click(object sender, EventArgs e)
        {
            string searchKeyword = txtSearchStudent.Text.Trim();
            BindGridView(searchKeyword);
        }

        private void BindGridView(string searchKeyword)
        {
            // Set the SelectParameters for the SqlDataSource based on the search keyword
            if (string.IsNullOrEmpty(searchKeyword))
            {
                // If search keyword is empty, retrieve details of all students
                test1.SelectCommand = "SELECT s.STUDENTNO, s.STUDENTNAME, s.CONTACT, s.DOB, s.EMAILADDRESS, s.COUNTRY, e.ENROLLDATE, c.COURSEID, c.COURSETITLE " +
                                       "FROM STUDENT s " +
                                       "INNER JOIN ENROLLMENT e ON s.STUDENTNO = e.STUDENTNO " +
                                       "INNER JOIN COURSE c ON e.COURSEID = c.COURSEID";
                test1.SelectParameters.Clear();
            }
            else
            {
                // If search keyword is provided, retrieve details of the specific student
                test1.SelectCommand = "SELECT s.STUDENTNO, s.STUDENTNAME, s.CONTACT, s.DOB, s.EMAILADDRESS, s.COUNTRY, e.ENROLLDATE, c.COURSEID, c.COURSETITLE " +
                                       "FROM STUDENT s " +
                                       "INNER JOIN ENROLLMENT e ON s.STUDENTNO = e.STUDENTNO " +
                                       "INNER JOIN COURSE c ON e.COURSEID = c.COURSEID " +
                                       "WHERE s.STUDENTNAME LIKE '%' || :SearchKeyword || '%'";
                test1.SelectParameters.Clear();
                test1.SelectParameters.Add("SearchKeyword", searchKeyword);
            }

            // Re-bind the GridView
            GridView1.DataBind();   
        }

    }
}
