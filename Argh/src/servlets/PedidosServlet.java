package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.logicPedidos;

/**
 * Servlet implementation class PedidosServlet
 */
@WebServlet("/PedidosServlet")
public class PedidosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection C=null;
	PreparedStatement pstmt =null;
	ResultSet rs=null;
	HttpSession miSesion=null;
	logicPedidos lp = new logicPedidos();
    public PedidosServlet() {
        super();
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
		miSesion = request.getSession();
		 String user= miSesion.getAttribute("usuario").toString();
		 String contra = miSesion.getAttribute("contra").toString();
		 //String evento= miSesion.getAttribute("activado").toString();
		String id= request.getParameter("aux");
	
		String aux= lp.entregar(user, contra, id);
		if(aux==null) {
			response.sendRedirect("PedidosPorEntregar.jsp");

		}
		else
		response.sendRedirect("PedidosPorEntregar.jsp?control="+aux);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		miSesion = request.getSession();
		 String user= miSesion.getAttribute("usuario").toString();
		 String contra = miSesion.getAttribute("contra").toString();
		 String evento= miSesion.getAttribute("activado").toString();
	
			String id= request.getParameter("idsHidden");
			String[] ids =	id.split("\\s*,\\s*");
			String cantidad = request.getParameter("cantidadesHidden");
			String[] cantidades =	cantidad.split("\\s*,\\s*");
			String mozo = request.getParameter("mozo");
			String mesa =request.getParameter("mesa");
			String total= request.getParameter("tot");

		
				String aux= lp.agregar(user, contra, total,mesa,mozo,evento,ids,cantidades);		
	
		
				if(aux==null) {
					response.sendRedirect("AgregarPedidos.jsp");

				}
				else
				response.sendRedirect("AgregarPedidos.jsp?control="+aux);
			
		
		
	}

}
