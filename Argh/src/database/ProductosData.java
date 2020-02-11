package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import entities.Producto;

public class ProductosData {
	Connection C = null;
	ResultSet rs=null;
	PreparedStatement pstmt=null;

	public ArrayList<Producto> getAll(String id) throws SQLException {
		ArrayList<Producto> prodList =null;
		System.out.println("Entra al productosData");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root","adrielcolo");
//				Connection C = DriverManager.getConnection("jdbc:mysql://sql213.epizy.com/epiz_24914012_tparg",
//						"epiz_24914012","LHo7Qpn2JaoM");
			//	Connection c = new ConexionMySQL(); //ConexionMySQL
			//	System.out.println("getAll " + id);
				 prodList = new ArrayList<Producto>();
				String query = "SELECT * FROM tparg.productos where productosIdEvento = ? ;";
				PreparedStatement pstmt = C.prepareStatement(query);
				pstmt.setString(1, id );
				//pstmt.executeQuery();
				rs = pstmt.executeQuery();
					 
				while(rs.next()) {
						Producto prod = new Producto();
						prod.setId(rs.getInt("idProductos"));
						prod.setNombre(rs.getString("nombre"));
						prod.setPrecio(rs.getFloat("precio"));
						prod.setStockIni(rs.getInt("stockIni"));
						prod.setVendidos(rs.getInt("vendidos"));
						prodList.add(prod);
						System.out.println("Crea un producto!");
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
		
		return prodList;

	}

}
