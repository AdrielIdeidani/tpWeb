package logic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

public class logicMozos {
	Connection C=null;
	PreparedStatement pstmt =null;
	ResultSet rs=null;
	HttpSession miSesion=null;
	String resultado=null;
	
	public String agregar(String user, String contra, String apellido, String nombre, String evento) {
		if(nombre.isEmpty()) {
			resultado="Ingrese un nombre para el Mozo";
		}
		else {
			
		
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					user,contra);
			
			String query = "Insert into tparg.mozo (apellido,nombre,mozoIdEvento) values (?,?,?);";
			PreparedStatement pstmt = C.prepareStatement(query);
			
			pstmt.setString(1, apellido);
			pstmt.setString(2, nombre);
			pstmt.setString(3, evento  );//request.getParameter("idEventoActivo")

			pstmt.executeUpdate();
			pstmt.close();
			C.close();
		} catch (SQLException e) {
			resultado= e.getMessage();
			e.printStackTrace();
		}
		}
		return resultado;
		
	}
	
	public String eliminar (String user, String contra, String id) {
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					 user,contra);
			
			
				//System.out.println("llega al borrar mesa! " +  request.getParameter("aux"));
			String query = "delete from  tparg.mozo where idMozo=?;";
			PreparedStatement pstmt = C.prepareStatement(query);
			
			pstmt.setString(1, id);

			pstmt.executeUpdate();
			pstmt.close();
			C.close();
		} catch (SQLException e) {
			 resultado= e.getMessage();
			e.printStackTrace();
		}
		
		return resultado;
	}

}
