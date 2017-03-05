package Final;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ListController
 */
@WebServlet("/Final/List")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public List() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init( ServletConfig config ) throws ServletException
    {
        super.init( config );

        try
        {
            Class.forName( "com.mysql.jdbc.Driver" );
        }
        catch( ClassNotFoundException e )
        {
            throw new ServletException( e );
        }
    }
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<LinkBean> items = new ArrayList<LinkBean>();
        Connection c = null;
        
        try
        {
            String url = "jdbc:mysql://cs3.calstatela.edu/cs3220stu53";
            String username = "cs3220stu53";
            String password = "!.S60cVG";

            c = DriverManager.getConnection( url, username, password );
            Statement stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery( "SELECT  * FROM link ORDER BY point DESC,title ASC " );

            while( rs.next() )
            {
                LinkBean item = new LinkBean( rs.getInt( "id" ),rs.getString( "title" ), rs.getString( "url" ) , rs.getInt("point"));

            	  items.add(item);            	  
              
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
        request.setAttribute( "items", items );

        request.getRequestDispatcher( "/WEB-INF/Linked.jsp" ).forward(
            request, response );
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	
        doGet( request, response );
    }

}
