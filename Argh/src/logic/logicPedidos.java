package logic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

public class logicPedidos {
	Connection C=null;
	PreparedStatement pstmt =null;
	ResultSet rs=null;
	HttpSession miSesion=null;
	String resultado;
	String idPedNuevo=null;
	
	public String entregar(String user, String contra, String id) {
		resultado=null;
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
						user,contra);
			 String query = "update tparg.pedido set horaEntrega=current_time() where nroPedido=?;";
				PreparedStatement pstmt = C.prepareStatement(query);
				
				pstmt.setString(1, id);
				

				pstmt.executeUpdate();
				pstmt.close();
				C.close();
			} catch (SQLException e) {
				resultado=e.getMessage();
				e.printStackTrace();
			}
		return resultado;
	}
	
	public String agregar(String user, String contra,String total, 
			String mesa, String mozo, String evento, String[] ids, String[] cantidades) {
		resultado=null;
		String idPedido=null;
		idPedNuevo=null;
	try {
		
	
		 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				 user,contra);
		
//		String query = "insert into tparg.pedido (total,nroMesa,idMozo,pedidoIdEvento,horaEntrega) values (?,?,?,?,null);" ;	
//		
//		PreparedStatement pstmt = C.prepareStatement(query);
		PreparedStatement pstmt = C.prepareStatement("insert into tparg.pedido (total,nroMesa,idMozo,pedidoIdEvento,horaEntrega) values (?,?,?,?,null)",
				Statement.RETURN_GENERATED_KEYS);	
		
		pstmt.setObject(1, total );
		pstmt.setString(2, mesa); //Mesa
		pstmt.setString(3, mozo); //Mozo
		pstmt.setString(4, evento);//Evento 
		pstmt.executeUpdate();
		ResultSet rs = pstmt.getGeneratedKeys();	
		
		if(rs.next()) {
		idPedido=rs.getString(1);
		idPedNuevo=idPedido;
		//System.out.println("idPedido = " + idPedido);
		}
		
		pstmt.close();
		// pstmt.execute(query, Statement.RETURN_GENERATED_KEYS);
		// ResultSet keys = pstmt.getGeneratedKeys();
		
		
		//AGREGAR PRODUCTOS-PEDIDOS
		String query = "insert into tparg.pedido_producto values (?,?,?);";  //idProducto, nroPedido, cantidad
		
	 for(int i=0;i< ids.length;i++) { 
		 if(Integer.parseInt(cantidades[i])>0) {

		pstmt = C.prepareStatement(query);	
		pstmt.setObject(1, ids[i] );
		pstmt.setString(2, idPedido); //Mesa
		pstmt.setString(3, cantidades[i]); 
		pstmt.executeUpdate();
		 }
		
		
		
	
	 }
	 //Actualizar vendidos de los productos
	  query = "update productos set vendidos=(vendidos+?) where idProductos=?;";
	 for(int i=0;i< ids.length;i++) { 
		 if(Integer.parseInt(cantidades[i])>0) {

				pstmt = C.prepareStatement(query);	
				pstmt.setObject(1, cantidades[i] );
				pstmt.setString(2, ids[i]); 
				pstmt.executeUpdate();
		 
		 }
	 }
		 pstmt.close(); 
		 rs.close();		
		 C.close();
	} catch (SQLException e) {
		resultado= e.getMessage();
		e.printStackTrace();
	}
	return resultado;
	}
	
	
	public String agregarEntregar(String user, String contra,String total, 
			String mesa, String mozo, String evento, String[] ids, String[] cantidades) {
		resultado=null;
		
		
		resultado=agregar(user,contra,total,mesa,mozo,evento,ids,cantidades);
		resultado=entregar(user, contra, idPedNuevo);

	return resultado;
	}
	
}
