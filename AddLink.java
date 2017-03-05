package Final;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddLink
 */
@WebServlet("/Final/AddLink")
public class AddLink extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLink() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
    	String web = request.getParameter("url"); 
    	String error = " ";
        Connection c = null;
        try
        {
        	String url = "jdbc:mysql://cs3.calstatela.edu/cs3220stu53";
			String username = "cs3220stu53";
			String password = "!.S60cVG" ;
			String sql = "insert into link (title,url,point) values(?,?,'0')";	
			
			
            if(web == null || web.trim().isEmpty() && title.trim().isEmpty() || title == null)
        	{	 error = "Cannot be left blank. ";
        		request.setAttribute("error", error);
        	}else
        	{
        			c = DriverManager.getConnection(url,username,password);
        			PreparedStatement pstmt = c.prepareStatement(sql);
    				pstmt.setString(1,title);
        			pstmt.setString(2,web);
    				pstmt.executeUpdate();	
        	}
          
        }
        catch( SQLException e )
        {
            throw new ServletException( e );
        }
        finally
        {
            try
            {
                if( c != null ) c.close();
            }
            catch( SQLException e )
            {
                throw new ServletException( e );
            }
        }

    	
        response.sendRedirect("List");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
