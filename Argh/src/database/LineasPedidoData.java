package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.LineaPedido;
import entities.Producto;


public class LineasPedidoData {
	Connection C = null;
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	
	public ArrayList<LineaPedido> getAll(String user, String contra,String id) throws SQLException {
	
	//	System.out.println("Llega al Mesa Data! " + id);
		ArrayList<LineaPedido> lineaList =null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					user,contra);
			
		


				lineaList = new ArrayList<LineaPedido>();
				String query = "SELECT * FROM tparg.pedido_producto where nroPedido = ? ; ";
				PreparedStatement pstmt = C.prepareStatement(query);
				pstmt.setString(1,id );
				 rs = pstmt.executeQuery(); 
				while(rs.next()) {
						LineaPedido lp = new LineaPedido();
						String query2 = "SELECT * FROM tparg.productos where idProductos = ? ; ";
						PreparedStatement pstmt2 = C.prepareStatement(query2);
						pstmt2.setString(1,rs.getString("idProducto") );
						ResultSet rs2 = pstmt2.executeQuery();
						rs2.next();
						Producto p = new Producto();
						p.setId(rs2.getInt("idProductos"));
						p.setNombre(rs2.getString("nombre"));
						p.setPrecio(rs2.getFloat("precio"));
						p.setStockIni(rs2.getInt("stockIni"));
						lp.setCant(Integer.parseInt(rs.getString("cantidad")));
						lp.setProd(p);
						lineaList.add(lp);
						rs2.close();
						pstmt2.close();
				}
			rs.close();	//Si los saco de aca tira error, pero para mi no deberian aca e ir en el finally
			pstmt.close();
			
					
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	
		finally {
			
			C.close();
		

		}
		
		return lineaList;

	}
	


}