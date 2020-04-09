package logic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

public class logicMesas {
	Connection C=null;
	PreparedStatement pstmt =null;
	ResultSet rs=null;
	HttpSession miSesion=null;
	String resultado=null;
	
	public String eliminar(String user, String contra, String id) {
		
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					 user,contra);
			
			 
				//System.out.println("llega al borrar mesa! " +  request.getParameter("aux"));
			String query = "delete from  tparg.mesa where nroMesa=?";
			PreparedStatement pstmt = C.prepareStatement(query);
			
			pstmt.setString(1, id);
			

			pstmt.executeUpdate();
			pstmt.close();
			C.close();
		} catch (SQLException e) {
			resultado=e.getMessage();
			e.printStackTrace();
		}
		
		return resultado;
	}
	
	public String agregar (String user, String contra, String cantidad,String evento) {
		if (Integer.parseInt(cantidad)<1) {
			resultado="Agregue una capacidad positiva";
			
		} 
		else if (Integer.parseInt(cantidad)>0) {
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					 user,contra);
			
			String query = "Insert into tparg.mesa (cantidadPersonas,mesaIdEvento,estado) values (?,?,null);";
			PreparedStatement pstmt = C.prepareStatement(query);
			
			pstmt.setString(1, cantidad);
			pstmt.setString(2, evento); // request.getParameter("idEventoActivo")

			pstmt.executeUpdate();
			pstmt.close();
			C.close();
		} catch (SQLException e) {
			resultado=e.getMessage();
			e.printStackTrace();
		}
		}
		else resultado="Ingrese algun valor!";
		return resultado;
		
	}

}
