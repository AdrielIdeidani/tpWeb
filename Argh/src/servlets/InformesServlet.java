package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class InformesServlet
 */
@WebServlet("/InformesServlet")
public class InformesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection C=null;
	PreparedStatement pstmt =null;
	ResultSet rs=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InformesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void destroy() {
    	
        try {
    		C.close();
    	} catch (SQLException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
        }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action= request.getParameter("aux");
		if(action.contains("Mesas")) {
			response.sendRedirect("Informes/Mesas.jsp");
		}
		else if(action.contains("Mozos")) {
			response.sendRedirect("Informes/Mozos.jsp");
		}
		else if(action.contains("Productos")) {
			response.sendRedirect("Informes/Productos.jsp");
		}
		else if(action.contains("Pedidos")) {
			response.sendRedirect("Informes/Pedidos.jsp");
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
