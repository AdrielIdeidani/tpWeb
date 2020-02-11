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
		if(request.getParameter("auction").contains("Eliminar")) {
			//System.out.println("LLEGUE AL Eliminar "+ request.getParameter("aux").toString() + " " + request.getParameter("idEventoActivo"));

			try {
				 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
						 user,contra);
				String query = "Delete from tparg.productos where idProductos=? and productosIdEvento=?;";
				PreparedStatement pstmt = C.prepareStatement(query);
				
				pstmt.setObject(1, request.getParameter("aux"));
				pstmt.setObject(2, evento);//request.getParameter("idEventoActivo")

				pstmt.executeUpdate();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally{
				response.sendRedirect("Productos.jsp");
				
			}
			
		}
		else if (request.getParameter("auction").contains("Modificar")) {
			
			try {
				 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
						 user,contra);
				
				String query = "select nombre,stockIni,precio from tparg.productos where idProductos=? and productosIdEvento=?;";
				pstmt = C.prepareStatement(query);
				pstmt.setObject(1,request.getParameter("aux") );
				pstmt.setString(2, request.getParameter("idEventoActivo"));
				rs = pstmt.executeQuery();
				rs.next();
				String nombre=rs.getString("nombre");
				String precio =rs.getString("precio");
				String stockIni= rs.getString("stockIni");
				rs.close();
				pstmt.close();
				response.sendRedirect("ProductosInsert.jsp?nombre="+nombre
						+"&precio="+ precio +"&stockIni="+ stockIni	+"&id=" +request.getParameter("aux") 
						+"&idEventoActivo=" + request.getParameter("idEventoActivo"));
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{


			}
			
			
			
			
		}

		//System.out.println("He llegado al doGet con id="+request.getParameter("id") );
		//doPost(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 miSesion = request.getSession();
		 String user= miSesion.getAttribute("usuario").toString();
		 String contra = miSesion.getAttribute("contra").toString();
		 String evento= miSesion.getAttribute("activado").toString();
		String action= request.getParameter("auction");		
		
		if(action.contains("Insert")) {
			
			HttpSession miSesion = request.getSession(true);
		//	miSesion.getAttribute("activado");
			
			
			//System.out.println("Llega al Insert de Productos! " + miSesion.getAttribute("activado"));
	try {
		 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				 user,contra);
		
		String query = "Insert into tparg.productos (nombre,stockIni,vendidos,precio,productosIdEvento) values (?,?,'0',?,?);";
		PreparedStatement pstmt = C.prepareStatement(query);
		pstmt.setString(1, request.getParameter("nombre"));
		pstmt.setString(2, request.getParameter("stock"));
		pstmt.setString(3, request.getParameter("precio"));
		pstmt.setString(4, evento);
		

		pstmt.executeUpdate();
		pstmt.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally{
		response.sendRedirect("Productos.jsp");
		
	}
	}
		else if (action.contains("Modificar")) {
		
			//String desc = request.getParameter("nombreEvento");
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					 user,contra);
			
//			 System.out.println("Modificar");
//			 System.out.println("Fecha: " +request.getParameter("fecha") );
//			 System.out.println("Descripcion " + request.getParameter("nombreEvento"));
//			 System.out.println("Id " + request.getParameter("id"));
			String query = "update tparg.productos set nombre=?, stockIni=?, precio=? where idProductos=? and productosIdEvento=?;";
			PreparedStatement pstmt = C.prepareStatement(query);
			
			pstmt.setString(1, request.getParameter("nombre") );
			pstmt.setString(2, request.getParameter("stock"));
			pstmt.setString(3, request.getParameter("precio"));
			pstmt.setString(4, request.getParameter("id"));
			pstmt.setString(5,evento); //request.getParameter("idEventoActivo")
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{

			response.sendRedirect("Productos.jsp");
			
		}
			
		}
	}

}
