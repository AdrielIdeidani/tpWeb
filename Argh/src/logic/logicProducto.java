package logic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import entities.Producto;

public class logicProducto {
	Connection C=null;
	PreparedStatement pstmt =null;
	ResultSet rs=null;
	HttpSession miSesion=null;
	String completo;
	
	public String eliminar(String user, String contra,String id, String idEvento) {
		completo=null;
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					 user,contra);
			String query = "Delete from tparg.productos where idProductos=? and productosIdEvento=?;";
			PreparedStatement pstmt = C.prepareStatement(query);
			
			pstmt.setObject(1, id);
			pstmt.setObject(2, idEvento);//request.getParameter("idEventoActivo")

			pstmt.executeUpdate();
			pstmt.close();
			C.close();
		} catch (SQLException e) {
			completo=e.getMessage();
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return completo;
	}
	
	public String insert (String user, String contra,String nombre, String precio, String stock, String idEvento) {
		
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					 user,contra);
			
			String query = "Insert into tparg.productos (nombre,stockIni,vendidos,precio,productosIdEvento) values (?,?,'0',?,?);";
			PreparedStatement pstmt = C.prepareStatement(query);
			pstmt.setString(1, nombre);
			pstmt.setString(2, stock);
			pstmt.setString(3,precio);
			pstmt.setString(4, idEvento);
			pstmt.executeUpdate();
			pstmt.close();
			C.close();
		} catch (SQLException e) {
			completo=e.getMessage();
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return completo;
		
		
	}
	public Producto buscarProducto(String user, String contra,String id, String idEvento) {
		Producto p = new Producto();
		
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					 user,contra);
			
			String query = "select nombre,stockIni,precio from tparg.productos where idProductos=? and productosIdEvento=?;";
			pstmt = C.prepareStatement(query);
			pstmt.setObject(1,id );
			pstmt.setString(2,idEvento ); //request.getParameter("idEventoActivo")
			rs = pstmt.executeQuery();
			rs.next();
			p.setNombre(rs.getString("nombre"));
			p.setPrecio(rs.getFloat("precio"));
			p.setStockIni(rs.getInt("stockIni"));
			rs.close();
			pstmt.close();
			C.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return p;
	
	}
	
	public String modificar (String user, String contra,String nombre,
			String precio, String stock, String id,String idEvento) {
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					 user,contra);
			
//			 System.out.println("Modificar");
//			 System.out.println("Fecha: " +request.getParameter("fecha") );
//			 System.out.println("Descripcion " + request.getParameter("nombreEvento"));
//			 System.out.println("Id " + request.getParameter("id"));
			String query = "update tparg.productos set nombre=?, stockIni=?, precio=? where idProductos=? and productosIdEvento=?;";
			PreparedStatement pstmt = C.prepareStatement(query);
			
			pstmt.setString(1,nombre);
			pstmt.setString(2, stock);
			pstmt.setString(3, precio);
			pstmt.setString(4, id);
			pstmt.setString(5,idEvento); //request.getParameter("idEventoActivo")
			
			pstmt.executeUpdate();
			pstmt.close();
			C.close();
		} catch (SQLException e) {
			completo=e.getMessage();
			e.printStackTrace();
		}

		return completo;

	}
	
}
