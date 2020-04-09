package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.ProdPorEntregar;
import entities.Producto;

public class ProductosData {
	Connection C = null;
	ResultSet rs=null;
	PreparedStatement pstmt=null;

	
	public ArrayList<ProdPorEntregar> getPorEntregar(String user,String contra,String id) throws SQLException{
		ArrayList<ProdPorEntregar> prod= new ArrayList<ProdPorEntregar>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					user,contra);
			String query = "select p.idProductos,p.nombre, sum(pp.cantidad) as cant, ped.nroMesa, concat(m.nombre,\" \", m.apellido) as nomap\r\n" + 
					"from pedido ped\r\n" + 
					"inner join pedido_producto pp on pp.nroPedido=ped.nroPedido\r\n" + 
					"inner join productos p on pp.idProducto=p.idProductos\r\n" + 
					"inner join mozo m on m.idMozo =ped.idMozo\r\n" + 
					"where ped.horaEntrega is null and ped.pedidoIdEvento=?\r\n" + 
					"group by 1,4,5\r\n" + 
					"order by 1;";
			PreparedStatement pstmt = C.prepareStatement(query);
			pstmt.setString(1, id );
			rs = pstmt.executeQuery();
			String idAuxAnterior="-1";
			String idAux=null;
			ProdPorEntregar p=null;
			while(rs.next()) {
				
				idAux=rs.getString("idProductos");
				if(idAux.equals(idAuxAnterior)==true) {
					int cant=rs.getInt("cant");
					p.setCant(cant);
					String mesa=rs.getString("nroMesa");
					String mozo= rs.getString("nomap");
					String mesaMozo= cant + " para la Mesa: " + mesa +" (" + mozo+ "); ";
					p.setMozoMesa(mesaMozo);
					

				}
				else {
					if(p!=null) {
					 prod.add(p);
					}
					 p= new ProdPorEntregar();
					 p.setId(idAux);
					 int cant=rs.getInt("cant");
					 p.setCant(cant);
					 p.setNombre(rs.getString("nombre"));
						String mesa=rs.getString("nroMesa");
						String mozo= rs.getString("nomap");
						String mesaMozo= cant + " para la Mesa: " + mesa +" (" + mozo+ "); ";
					
					 p.setMozoMesa(mesaMozo);
		
					 idAuxAnterior=idAux;
				}
				
				
				
				
			}
			if(p!=null) {
				prod.add(p);	
			}
			rs.close();	//Si los saco de aca tira error, pero para mi no deberian aca e ir en el finally
			pstmt.close();
			
					
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		finally {
			
			C.close();
		

		}
		
		return prod;
	}

	
	
	public ArrayList<Producto> getAll(String user,String contra,String id) throws SQLException {
		ArrayList<Producto> prodList =null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					user,contra);

				 prodList = new ArrayList<Producto>();
				String query = "SELECT * FROM tparg.productos where productosIdEvento = ? ;";
				PreparedStatement pstmt = C.prepareStatement(query);
				pstmt.setString(1, id );
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
		finally {
			
			C.close();
		

		}

		
		return prodList;

	}

}
