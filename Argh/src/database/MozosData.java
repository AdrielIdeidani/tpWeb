package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.Mozo;




public class MozosData {
	Connection C = null;
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	
	public ArrayList<Mozo> getAll(String user, String contra,String id) throws SQLException {
	
		System.out.println("Llega al Mesa Data! " + id);
		ArrayList<Mozo> mozoslist =null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					user,contra);
//				Connection C = DriverManager.getConnection("jdbc:mysql://sql213.epizy.com/epiz_24914012_tparg",
//						"epiz_24914012","LHo7Qpn2JaoM");
			//	Connection c = new ConexionMySQL(); //ConexionMySQL
				//System.out.println("getAll");
				mozoslist = new ArrayList<Mozo>();
				String query = "SELECT * FROM tparg.mozo where mozoIdEvento = ? ; ";
				PreparedStatement pstmt = C.prepareStatement(query);
				pstmt.setString(1,id );
				 rs = pstmt.executeQuery(); //Da error si pongo executeQuery(query). En otros datas se usa asi 
			
				while(rs.next()) {
						Mozo mozo = new Mozo();
						mozo.setId(rs.getInt("idMozo"));
						mozo.setNombre(rs.getString("nombre"));
						mozo.setApellido(rs.getString("apellido"));
						mozoslist.add(mozo);
					
				}
			rs.close();	//Si los saco de aca tira error, pero para mi no deberian aca e ir en el finally
			pstmt.close();
			
					
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	
		finally {
			
			C.close();
		

		}
		
		return mozoslist;

	}

	public Mozo getOne(String user, String contra,int id) throws SQLException {
		System.out.println("id mozos data " + id);
		Mozo mozo = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					user,contra);
//				Connection C = DriverManager.getConnection("jdbc:mysql://sql213.epizy.com/epiz_24914012_tparg",
//						"epiz_24914012","LHo7Qpn2JaoM");
			//	Connection c = new ConexionMySQL(); //ConexionMySQL
				//System.out.println("getAll");
				String query = "SELECT * FROM tparg.mozo where idMozo = ? ; ";
				PreparedStatement pstmt = C.prepareStatement(query);
				pstmt.setInt(1,id );
				rs = pstmt.executeQuery(); //Da error si pongo executeQuery(query). En otros datas se usa asi 
			
				if(rs.next()) {
					mozo = new Mozo();
						//System.out.println(rs.getInt("idMozo"));
						mozo.setId(rs.getInt("idMozo"));
						mozo.setNombre(rs.getString("nombre"));
						mozo.setApellido(rs.getString("apellido"));
						
					
				}
			rs.close();	//Si los saco de aca tira error, pero para mi no deberian aca e ir en el finally
			pstmt.close();
			
					
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	
		finally {
			
			C.close();
		

		}

		
		
		return mozo;
	}
	public int getVendidos(String user, String contra,int idMozo,int idEvento) throws SQLException {

		int total=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					user,contra);

				String query = "select sum(total) as Total from tparg.pedido where horaEntrega is not null and pedidoIdEvento=? and idMozo=?;";
						
				PreparedStatement pstmt = C.prepareStatement(query);
				pstmt.setInt(1,idEvento);
				pstmt.setInt(2,idMozo );
				rs = pstmt.executeQuery(); //Da error si pongo executeQuery(query). En otros datas se usa asi 
			
				if(rs.next()) {
						total=rs.getInt("Total");
						//System.out.println(rs.getInt("idMozo"));
						
					
				}
			rs.close();	//Si los saco de aca tira error, pero para mi no deberian aca e ir en el finally
			pstmt.close();
					
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	
		finally {
			
			C.close();
		

		}
		return total;

		
	}
}