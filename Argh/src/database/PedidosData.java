package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.Pedido;

public class PedidosData {
	Connection C = null;
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	
	public ArrayList<Pedido> getAll(String user, String contra,String id) throws SQLException {
	
		
		ArrayList<Pedido> pedidoList =null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					user,contra);

//				Connection C = DriverManager.getConnection("jdbc:mysql://sql213.epizy.com/epiz_24914012_tparg",
//						"epiz_24914012","LHo7Qpn2JaoM");
			//	Connection c = new ConexionMySQL(); //ConexionMySQL
				//System.out.println("getAll");
				pedidoList = new ArrayList<Pedido>();
				String query = "SELECT * FROM tparg.pedido where pedidoIdEvento = ? and isnull(horaEntrega) ; ";
				PreparedStatement pstmt = C.prepareStatement(query);
				pstmt.setString(1,id );
				 rs = pstmt.executeQuery(); //Da error si pongo executeQuery(query). En otros datas se usa asi 
			
				while(rs.next()) {
		
						Pedido pedido = new Pedido();
						pedido.setNroPedido(rs.getInt("nroPedido"));
						pedido.setIdMesa(rs.getInt("nroMesa"));
						pedido.setIdMozo(rs.getInt("idMozo"));
						pedido.setTotal(rs.getFloat("total"));
						pedidoList.add(pedido);
						
					
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
		
		return pedidoList;

	}
	
	public ArrayList<Pedido> getEntregados(String id) throws SQLException {
		
		ArrayList<Pedido> pedidoList =null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root","adrielcolo");
//				Connection C = DriverManager.getConnection("jdbc:mysql://sql213.epizy.com/epiz_24914012_tparg",
//						"epiz_24914012","LHo7Qpn2JaoM");
			//	Connection c = new ConexionMySQL(); //ConexionMySQL
				//System.out.println("getAll");
				pedidoList = new ArrayList<Pedido>();
				String query = "SELECT * FROM tparg.pedido where pedidoIdEvento = ? and horaEntrega is not null ; ";
				PreparedStatement pstmt = C.prepareStatement(query);
				pstmt.setString(1,id );
				 rs = pstmt.executeQuery(); //Da error si pongo executeQuery(query). En otros datas se usa asi 
			
				while(rs.next()) {
						Pedido pedido = new Pedido();
						pedido.setNroPedido(rs.getInt("nroPedido"));
						pedido.setIdMesa(rs.getInt("nroMesa"));
						pedido.setIdMozo(rs.getInt("idMozo"));
						pedido.setTotal(rs.getFloat("total"));
						pedido.setHoraEntrega(rs.getTime("horaEntrega"));
						System.out.println(pedido.getHoraEntrega());
						pedidoList.add(pedido);
					
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
		
		return pedidoList;
	}


}
