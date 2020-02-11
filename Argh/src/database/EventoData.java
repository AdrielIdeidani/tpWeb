package database;

import java.sql.*;
import java.util.ArrayList;



import entities.Evento;

public class EventoData {
	Connection C = null;
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	
	
	public Evento getOne(String id, String fecha) throws SQLException{		
		ConexionMySQL c = new ConexionMySQL();
		System.out.println("getOne de id y fecha");
		Evento event = new Evento();
		String query = "SELECT * FROM evento WHERE idEvento = ? and fecha = ?";
		PreparedStatement pstmt = c.getConnection().prepareStatement(query);
		pstmt.setString(1, id);
		pstmt.setString(2, fecha);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		event.setId(rs.getInt("idEvento"));
		event.setFecha(rs.getDate("fecha"));
		event.setDesc(rs.getString("descripcion"));
		rs.close();
		pstmt.close();
		c.getConnection().close();
		System.out.println("Conexion finalziada");
		return event;	
	}
	
	public Evento getOne(String id) throws SQLException{
		C = new ConexionMySQL();
		System.out.println("getOne de id");
		Evento event = new Evento();
		String query = "SELECT * FROM evento WHERE idEvento = ?";
		 pstmt = C.prepareStatement(query);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		rs.next();
		event.setId(rs.getInt("idEvento"));
		event.setFecha(rs.getDate("fecha"));
		event.setDesc(rs.getString("descripcion"));
		rs.close();
		pstmt.close();
		C.close();
		System.out.println("Conexion finalziada");
		return event;	
	}
	
	public ArrayList<Evento> getAll() throws SQLException {
		ArrayList<Evento> eventlist =null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root","adrielcolo");
//				Connection C = DriverManager.getConnection("jdbc:mysql://sql213.epizy.com/epiz_24914012_tparg",
//						"epiz_24914012","LHo7Qpn2JaoM");
			//	Connection c = new ConexionMySQL(); //ConexionMySQL
				//System.out.println("getAll");
				 eventlist = new ArrayList<Evento>();
				String query = "SELECT * FROM tparg.evento";
				PreparedStatement pstmt = C.prepareStatement(query);
				  rs = pstmt.executeQuery(query);
					 
				while(rs.next()) {
						Evento event = new Evento();
						event.setId(rs.getInt("idEvento"));
						event.setFecha(rs.getDate("fecha"));
						event.setDesc(rs.getString("descripcion"));
						eventlist.add(event);
					
				}
			rs.close();	//Si los saco de aca tira error, pero para mi no deberian aca e ir en el finally
			pstmt.close();
			
					
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	//		try {

//	} catch (SQLException ex) {"
		//finally
//	}
	
		finally {
			
			C.close();
		
		//	System.out.println("Conexion finalizada");

		}
		
		return eventlist;

	}
	
//	public void insertOne(String fecha, String desc) throws SQLException{
//		ConexionMySQL c = new ConexionMySQL();
//		System.out.println("InserOne");
//		String query = "INSERT INTO evento (fecha, descripcion) VALUES (?,?)";
//		PreparedStatement pstmt = c.getConnection().prepareStatement(query);
//		pstmt.setString(1, fecha);
//		pstmt.setString(2, desc);
//		pstmt.executeUpdate();
//		pstmt.close();
//		c.getConnection().close();
//		System.out.println("Conexion finalziada");
//	}
//	
//	public void deleteOne(String id) throws SQLException{
//		ConexionMySQL c = new ConexionMySQL();
//		System.out.println("deleteOne");
//		String query = "DELETE FROM evento WHERE idEvento=?";
//		PreparedStatement pstmt = c.getConnection().prepareStatement(query);
//		pstmt.setString(1, id);
//		pstmt.executeUpdate();
//		pstmt.close();
//		c.getConnection().close();
//		System.out.println("Conexion finalziada");
//	}
//	
//	public void updateOne(String id, String fecha, String desc) throws SQLException{
//		ConexionMySQL c = new ConexionMySQL();
//		System.out.println("updateOne");
//		String query = "UPDATE evento SET fecha=?, descripcion=? WHERE idEvento=?";
//		PreparedStatement pstmt = c.getConnection().prepareStatement(query);
//		pstmt.setString(1, fecha);
//		pstmt.setString(2, desc);
//		pstmt.setString(3, id);
//		pstmt.executeUpdate();
//		pstmt.close();
//		c.getConnection().close();
//		System.out.println("Conexion finalziada");
//	} 

}

	