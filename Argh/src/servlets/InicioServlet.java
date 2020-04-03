package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class InicioServlet
 */
@WebServlet("/InicioServlet")
public class InicioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection C=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InicioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void destroy() {
    	
        try {
    		C.close();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
        }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String contra= request.getParameter("contra");
		System.out.println(contra);
		String user =request.getParameter("usuario");
		System.out.println(user);
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					user,contra); //"root","adrielcolo"
		
		HttpSession miSesion = request.getSession(true);
		miSesion.setAttribute("usuario", user);
		miSesion.setAttribute("contra", contra);
		miSesion.setAttribute("activado","0");
		response.sendRedirect("PanelDeControl.jsp");
		}
		catch (SQLException e) {
			System.out.println("Error de conexion!");
			e.printStackTrace();
			response.sendRedirect("Inicio.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
