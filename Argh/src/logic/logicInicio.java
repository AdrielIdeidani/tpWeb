package logic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class logicInicio {
	Connection C=null;
	String completo;
	public logicInicio(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

	public String conectar(String user, String contra) {
		completo= null;
		try {
			
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					user,contra); //"root","adrielcolo"
			 C.close();
		}
		catch (SQLException e) {
			completo="Contraseña y/o usuario incorrecto!" + e.getMessage();
			e.printStackTrace();
		
	}
		return completo;

}
}
