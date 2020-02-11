package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
//import java.sql.Date;
import java.time.*;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.mysql.jdbc.Statement;

import database.ConexionMySQL;
import database.EventoData;
import entities.Evento;


@WebServlet("/EventosServlet")
public class EventosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection C=null;
	PreparedStatement pstmt =null;
	ResultSet rs=null;
	HttpSession miSesion=null;
    public EventosServlet() {
    	
        super();
    }
    public void destroy() {
    	
    try {
		C.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
    }
    
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Accion " + request.getParameter("auction"));
		 miSesion = request.getSession();
		 String user= miSesion.getAttribute("usuario").toString();
		 String contra = miSesion.getAttribute("contra").toString();
		if(request.getParameter("auction").contains("Eliminar")) {
			System.out.println("LLEGUE AL Eliminar "+ request.getParameter("aux").toString());

			try {
				 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
						user,contra);
				String query = "Delete from tparg.evento where idEvento=?;";
				 pstmt = C.prepareStatement(query);
				
				pstmt.setObject(1, request.getParameter("aux"));
				pstmt.executeUpdate();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
			
				response.sendRedirect("Eventos.jsp");
				
			}
			
		}
		else if (request.getParameter("auction").contains("Modificar")) {
			try {
				 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
						 user,contra);
				
				String query = "select fecha,descripcion from tparg.evento where idEvento=?;";
				 pstmt = C.prepareStatement(query);
				pstmt.setObject(1,request.getParameter("aux") );
				 rs = pstmt.executeQuery();
				 rs.next();
				String nombre=rs.getString("Descripcion");
				Date fecha =rs.getDate("Fecha");;
				
				//Cookie miCookie= new Cookie("id",request.getParameter("aux"));
				//miCookie.setMaxAge();
				rs.close();
				pstmt.close();
				//response.addCookie(miCookie);
				response.sendRedirect("EventosInsert.jsp?nombre="+nombre
						+"&fecha="+ fecha +"&id="+ request.getParameter("aux")	);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{


			}
			
			
			

		}
		
		
		else if (request.getParameter("auction").contains("Activar")) {
			//Podria añadir aca un arraylist de los productos, mesasymozos
			miSesion.setAttribute("activado", request.getParameter("aux").toString());
			response.sendRedirect("Eventos.jsp");
			
			
		}
		

	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action= request.getParameter("auction");		
		 miSesion = request.getSession();
		 String user= miSesion.getAttribute("usuario").toString();
		 String contra = miSesion.getAttribute("contra").toString();
		if(action.contains("Insert")) {
			
		System.out.println("Llega al insert! " + request.getParameter("fecha"));
		
		DateTimeFormatter f = DateTimeFormatter.ofPattern( "yyyy-MM-dd" ) ; //dd/MM/uuuu
		LocalDate ld = LocalDate.parse( request.getParameter("fecha"), f ) ;
		String desc = request.getParameter("nombreEvento");
	try {
		 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				user,contra);
		
		String query = "Insert into tparg.evento (Fecha, Descripcion) values (date_add(?,interval 1 day),?);";
		PreparedStatement pstmt = C.prepareStatement(query);
		pstmt.setObject(1, ld );
		pstmt.setString(2, desc);

		pstmt.executeUpdate();
		pstmt.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	finally{

		response.sendRedirect("Eventos.jsp");
		
	}
	}
		else if(action.contains("Modificar")) {
			DateTimeFormatter f = DateTimeFormatter.ofPattern( "yyyy-MM-dd" ) ; //dd/MM/uuuu
			LocalDate ld = LocalDate.parse( request.getParameter("fecha"), f ) ;
			String desc = request.getParameter("nombreEvento");
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					 user,contra);
			
			 System.out.println("Modificar");
			 System.out.println("Fecha: " +request.getParameter("fecha") );
			 System.out.println("Descripcion " + request.getParameter("nombreEvento"));
			 System.out.println("Id " + request.getParameter("id"));
			String query = "update tparg.evento set Fecha=(date_add(?,interval 1 day)), Descripcion=? where idEvento=?;";
			PreparedStatement pstmt = C.prepareStatement(query);
			
			pstmt.setObject(1, ld );
			pstmt.setString(2, desc);
			pstmt.setObject(3, request.getParameter("id"));
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{

			response.sendRedirect("Eventos.jsp");
			
		}
			
		}
	

	
	}


}


