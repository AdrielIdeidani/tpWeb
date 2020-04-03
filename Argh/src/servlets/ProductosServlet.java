package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Producto;
import logic.logicProducto;

/**
 * Servlet implementation class ProductosServlet
 */
@WebServlet("/ProductosServlet")
public class ProductosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection C=null;
	PreparedStatement pstmt =null;
	ResultSet rs=null;
	HttpSession miSesion=null;
	logicProducto lp= new logicProducto();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductosServlet() {
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


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("Productos:Accion " + request.getParameter("auction"));
		 miSesion = request.getSession();
		 String user= miSesion.getAttribute("usuario").toString();
		 String contra = miSesion.getAttribute("contra").toString();
		 String evento = miSesion.getAttribute("activado").toString();
		
		 //Eliminar
		 if(request.getParameter("auction").contains("Eliminar")) {
			//System.out.println("LLEGUE AL Eliminar "+ request.getParameter("aux").toString() + " " + request.getParameter("idEventoActivo"));
			String aux = lp.eliminar(user, contra, request.getParameter("aux"), evento);
			
		if(aux==null) {
			response.sendRedirect("Productos.jsp");

		}
		else
			response.sendRedirect("Productos.jsp?control=" + aux);


				
		
			
		}
		 //Buscar Producto para Modificar
		else if (request.getParameter("auction").contains("Modificar")) {
			Producto p = new Producto();
			p=lp.buscarProducto(user, contra, request.getParameter("aux") , evento);
			
		
				response.sendRedirect("ProductosInsert.jsp?nombre="+p.getNombre()
				+"&precio="+ p.getPrecio() +"&stockIni="+ p.getStockIni()	+"&id=" +request.getParameter("aux") 
				+"&idEventoActivo=" + evento);
		
				
			

		}

	
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 miSesion = request.getSession();
		 String user= miSesion.getAttribute("usuario").toString();
		 String contra = miSesion.getAttribute("contra").toString();
		 String evento= miSesion.getAttribute("activado").toString();
		String action= request.getParameter("auction");		
		
		if(action.contains("Insert")) {
			
		String aux=	lp.insert(user, contra, request.getParameter("nombre"),
					request.getParameter("precio"), request.getParameter("stock"), evento);
			
			
		if(aux==null) {
			response.sendRedirect("Productos.jsp");

		}
		else
			response.sendRedirect("Productos.jsp?control=" + aux);
		

	}
		else if (action.contains("Modificar")) {
			String aux= lp.modificar(user, contra, request.getParameter("nombre"), request.getParameter("precio"), 
					 request.getParameter("stock"), request.getParameter("id"), evento);
		
			//String desc = request.getParameter("nombreEvento");
		
			if(aux==null) {
				response.sendRedirect("Productos.jsp");

			}
			else
				response.sendRedirect("Productos.jsp?control=" + aux);
			
	
			
		}
	}

}
