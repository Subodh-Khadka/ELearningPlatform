using System;
using System.Web.UI.WebControls;

namespace ELearningPlatform
{
    public partial class CourseInstructor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewGrid("");
            }
        }

        protected void ClickSearchButton(object sender, EventArgs e)
        {
            string searchInputValue = searchCourse.Text.Trim();
            ViewGrid(searchInputValue);
        }

        public void ViewGrid(string searchInputValue)
        {
            if (string.IsNullOrEmpty(searchInputValue))
            {
                CourseInstruct.SelectCommand =
                                    @"SELECT c.COURSEID, c.COURSETITLE, i.COURSEINSTRUCTORID, i.COURSEINSTRUCTORNAME
                                    FROM course c
                                    LEFT JOIN course_instructor_student cis ON c.COURSEID = cis.COURSEID
                                    LEFT JOIN instructor i ON cis.COURSEINSTRUCTORID = i.COURSEINSTRUCTORID
                                                           AND i.COURSEINSTRUCTORID IN (
                                                                SELECT COURSEINSTRUCTORID
                                                                FROM course_instructor_student
                                                                GROUP BY COURSEINSTRUCTORID
                                                                HAVING COUNT(DISTINCT COURSEID) >= 2
                                                           )
                                    ORDER BY c.COURSEID";
                CourseInstruct.SelectParameters.Clear();
            }
            else
            {
                CourseInstruct.SelectCommand = "";
                  
                CourseInstruct.SelectParameters.Clear();
                CourseInstruct.SelectParameters.Add("SearchKeyword", searchInputValue);
            }


            GridView1.DataBind();
        }
    }
}