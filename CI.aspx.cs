using System;
using System.Web.UI.WebControls;

namespace ELearningPlatform
{
    public partial class CI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        protected void dlist(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex >= 0)
            {
                string selectedCourseId = DropDownList1.SelectedValue;
                cigrid.SelectCommand = @"SELECT c.COURSEID, c.COURSETITLE, i.COURSEINSTRUCTORID, i.COURSEINSTRUCTORNAME
                 FROM course c
                 JOIN course_instructor_student cis ON c.COURSEID = cis.COURSEID
                 JOIN instructor i ON cis.COURSEINSTRUCTORID = i.COURSEINSTRUCTORID
                 WHERE c.COURSEID = :SelectedCourseId
                 AND i.COURSEINSTRUCTORID IN (
                     SELECT COURSEINSTRUCTORID
                     FROM course_instructor_student
                     GROUP BY COURSEINSTRUCTORID
                     HAVING COUNT(DISTINCT COURSEID) >= 2
                 )
                 ORDER BY c.COURSEID";

                cigrid.SelectParameters.Clear();
                cigrid.SelectParameters.Add("SelectedCourseId", selectedCourseId);
            }
            else
            {
                cigrid.SelectCommand = @"SELECT c.COURSEID, c.COURSETITLE, i.COURSEINSTRUCTORID, i.COURSEINSTRUCTORNAME
                                  FROM course c
                                  JOIN course_instructor_student cis ON c.COURSEID = cis.COURSEID
                                  JOIN instructor i ON cis.COURSEINSTRUCTORID = i.COURSEINSTRUCTORID
                                  WHERE i.COURSEINSTRUCTORID IN (
                                      SELECT COURSEINSTRUCTORID
                                      FROM course_instructor_student
                                      GROUP BY COURSEINSTRUCTORID
                                      HAVING COUNT(DISTINCT COURSEID) >= 2      
                                  )
                                  ORDER BY c.COURSEID";
            }
            GridView1.DataBind();
        }
    }
}


//@"SELECT c.COURSEID, c.COURSETITLE, i.COURSEINSTRUCTORID, i.COURSEINSTRUCTORNAME
//             FROM course c
//             LEFT JOIN course_instructor_student cis ON c.COURSEID = cis.COURSEID
//             LEFT JOIN instructor i ON cis.COURSEINSTRUCTORID = i.COURSEINSTRUCTORID
//             WHERE c.COURSEID = :SelectedCourseId
//             ORDER BY c.COURSEID";