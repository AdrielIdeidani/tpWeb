package logic;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.chrono.ChronoLocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import entities.Evento;

public class logicEvento {
	Connection C=null;
	PreparedStatement pstmt =null;
	ResultSet rs=null;
	
	boolean completo =true;
	
	public boolean eliminar(String user, String contra,String id) {
	
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					user,contra);
			String query = "Delete from tparg.evento where idEvento=?;";
			 pstmt = C.prepareStatement(query);
			
			pstmt.setObject(1,id);
			pstmt.executeUpdate();
			pstmt.close();
			C.close();
		} catch (SQLException e) {
			completo=false;
			e.printStackTrace();
		}
		return completo;
	}
	public String modificar (String user, String contra,String id, LocalDate fecha,String desc) {
		String resultado=null;
		if(fecha.isBefore(java.time.LocalDate.now())) {
			resultado = "La fecha ya paso!";
			
			
		}
		if(desc.isEmpty()) {
			resultado= "Ingrese algun texto como descripcion! Sea nombre del evento o algo para diferenciarlo";
			
		}
		//Solo la ultima validacion se mostraria como error
		//Solo se cambia si no hubo problema de validaciones
		if(resultado==null) {
			try {
		
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					 user,contra);
			
			String query = "update tparg.evento set Fecha=(date_add(?,interval 1 day)), Descripcion=? where idEvento=?;";
			PreparedStatement pstmt = C.prepareStatement(query);
			
			pstmt.setObject(1, fecha );
			pstmt.setString(2, desc);
			pstmt.setObject(3, id);
			
			pstmt.executeUpdate();
			pstmt.close();
			C.close();
		} catch (SQLException e) {
			resultado="Error en la Base de Datos. Intente mas tarde";
			e.printStackTrace();
		}
		}
		
	return resultado;	
	}
	
	public String agregar (String user, String contra, LocalDate fecha,String desc) {
		String resultado=null;
		if(fecha.isBefore(java.time.LocalDate.now())) {
			resultado = "La fecha ya paso!";
			
			
		}
		if(desc.isEmpty()) {
			resultado= "Ingrese algun texto como descripcion! Sea nombre del evento o algo para diferenciarlo";
			
		}
		//Solo la ultima validacion se mostraria como error
		//Solo se cambia si no hubo problema de validaciones
		if(resultado==null) {
			try {
		
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					 user,contra);
			
				String query = "Insert into tparg.evento (Fecha, Descripcion) values (date_add(?,interval 1 day),?);";
				PreparedStatement pstmt = C.prepareStatement(query);
				pstmt.setObject(1, fecha );
				pstmt.setString(2, desc);

				pstmt.executeUpdate();
				pstmt.close();
			C.close();
		} catch (SQLException e) {
			resultado="Error en la Base de Datos. Intente mas tarde";
			e.printStackTrace();
		}
		}
		
	return resultado;	
	}
	
	
	public Evento getEvento(String user, String contra,String id) {
		Evento ev= new Evento();
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					 user,contra);
			
			String query = "select fecha,descripcion from tparg.evento where idEvento=?;";
			 pstmt = C.prepareStatement(query);
			pstmt.setObject(1,id );
			 rs = pstmt.executeQuery();
			 rs.next();
			ev.setDesc(rs.getString("Descripcion"));
			ev.setFecha(rs.getDate("Fecha"));

			rs.close();
			pstmt.close();
			C.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return ev;
		
		
	}
	
	
}
