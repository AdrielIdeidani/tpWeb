package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import entities.Mesas;


public class MesasData {
	Connection C = null;
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	
	public ArrayList<Mesas> getAll(String id) throws SQLException {
	
		ArrayList<Mesas> mesaslist =null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root","adrielcolo");
//				Connection C = DriverManager.getConnection("jdbc:mysql://sql213.epizy.com/epiz_24914012_tparg",
//						"epiz_24914012","LHo7Qpn2JaoM");
			//	Connection c = new ConexionMySQL(); //ConexionMySQL
				//System.out.println("getAll");
				mesaslist = new ArrayList<Mesas>();
				String query = "SELECT * FROM tparg.mesa where mesaIdEvento = ? ; ";
				PreparedStatement pstmt = C.prepareStatement(query);
				pstmt.setString(1,id );
				 rs = pstmt.executeQuery(); //Da error si pongo executeQuery(query). En otros datas se usa asi 
			
				while(rs.next()) {
						Mesas mesas = new Mesas();
						mesas.setNroMesa(rs.getInt("nroMesa"));
						mesas.setCapacidad(rs.getInt("cantidadPersonas"));
						mesas.setEstado(rs.getString("estado"));
						mesaslist.add(mesas);
					
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
		
		return mesaslist;

	}
	
	public int getVendidos(int idMesa,int idEvento) throws SQLException {

		int total=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root","adrielcolo");
//				Connection C = DriverManager.getConnection("jdbc:mysql://sql213.epizy.com/epiz_24914012_tparg",
//						"epiz_24914012","LHo7Qpn2JaoM");
			//	Connection c = new ConexionMySQL(); //ConexionMySQL
				//System.out.println("getAll");
				String query = "select sum(total) as Total from pedido where horaEntrega is not null and pedidoIdEvento=? and nroMesa=? ;";
						
				PreparedStatement pstmt = C.prepareStatement(query);
				pstmt.setInt(1,idEvento);
				pstmt.setInt(2,idMesa );
				rs = pstmt.executeQuery(); //Da error si pongo executeQuery(query). En otros datas se usa asi 
			
				if(rs.next()) {
						total=rs.getInt("Total");
						
					
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
