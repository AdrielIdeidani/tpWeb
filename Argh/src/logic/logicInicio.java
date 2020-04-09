package logic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class logicInicio {
	Connection C=null;

	
	String completo;
	public String conectar(String user, String contra) {
		completo= null;
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					user,contra); //"root","adrielcolo"
			 C.close();
		}
		catch (SQLException e) {
			completo="Contraseña y/o usuario incorrecto!";
			e.printStackTrace();
		
	}
		return completo;

}
}
