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
import logic.logicEvento;


@WebServlet("/EventosServlet")
public class EventosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection C=null;
	PreparedStatement pstmt =null;
	ResultSet rs=null;
	HttpSession miSesion=null;
	 logicEvento le = null;
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
	//	System.out.println("Accion " + request.getParameter("auction"));
		 miSesion = request.getSession();
		 String user= miSesion.getAttribute("usuario").toString();
		 String contra = miSesion.getAttribute("contra").toString();
			le= new logicEvento();
			
		
		


		if(request.getParameter("auction").contains("Eliminar")) {
		

			String id =request.getParameter("aux");
			if(le.eliminar(user,contra,id)) response.sendRedirect("Eventos.jsp");
			//Falta agregar manejo de errores


			
		}
		//Con este se redirige al de la pagina para modificarlo.
		else if (request.getParameter("auction").contains("Modificar")) {
			Evento e = le.getEvento(user,contra, request.getParameter("aux"));
		
			
			response.sendRedirect("EventosInsert.jsp?nombre="+e.getDesc()
					+"&fecha="+ e.getFecha() +"&id="+ request.getParameter("aux")	);
			

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
		 String aux;
		 le= new logicEvento();
		if(action.contains("Insert")) {
			String desc = request.getParameter("nombreEvento");
			DateTimeFormatter f = DateTimeFormatter.ofPattern( "yyyy-MM-dd" ) ; //dd/MM/uuuu
			LocalDate ld = LocalDate.parse( request.getParameter("fecha"), f ) ;
			aux = le.agregar(user, contra, ld, desc);
		//System.out.println("Llega al insert! " + request.getParameter("fecha"));
		
		
		
//	try {
//		 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
//				user,contra);
//		
//		String query = "Insert into tparg.evento (Fecha, Descripcion) values (date_add(?,interval 1 day),?);";
//		PreparedStatement pstmt = C.prepareStatement(query);
//		pstmt.setObject(1, ld );
//		pstmt.setString(2, desc);
//
//		pstmt.executeUpdate();
//		pstmt.close();
//	} catch (SQLException e) {
//		e.printStackTrace();
//	}
//	finally{
				if(aux!= null) {
					response.sendRedirect("Eventos.jsp?control="+aux);

				}
				else if (aux==null) {
					response.sendRedirect("Eventos.jsp?");
					
				}
		
	//}
	}
		else if(action.contains("Modificar")) {
			DateTimeFormatter f = DateTimeFormatter.ofPattern( "yyyy-MM-dd" ) ; //dd/MM/uuuu
			LocalDate ld = LocalDate.parse( request.getParameter("fecha"), f ) ;
			String desc = request.getParameter("nombreEvento");
			
			 aux=le.modificar(user, contra, request.getParameter("id"), 
					ld, desc);
//		try {
//			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
//					 user,contra);
//			
//			 System.out.println("Modificar");
//			 System.out.println("Fecha: " +request.getParameter("fecha") );
//			 System.out.println("Descripcion " + request.getParameter("nombreEvento"));
//			 System.out.println("Id " + request.getParameter("id"));
//			String query = "update tparg.evento set Fecha=(date_add(?,interval 1 day)), Descripcion=? where idEvento=?;";
//			PreparedStatement pstmt = C.prepareStatement(query);
//			
//			pstmt.setObject(1, ld );
//			pstmt.setString(2, desc);
//			pstmt.setObject(3, request.getParameter("id"));
//			
//			pstmt.executeUpdate();
//			pstmt.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		finally{

				if(aux!= null) {
					response.sendRedirect("Eventos.jsp?control="+aux);

				}
				else if (aux==null) {
					response.sendRedirect("Eventos.jsp?");
					
				}
			
	//	}
			
		}
	

	
	}


}


