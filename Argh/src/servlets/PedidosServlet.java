package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PedidosServlet
 */
@WebServlet("/PedidosServlet")
public class PedidosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection C=null;
	PreparedStatement pstmt =null;
	ResultSet rs=null;
	HttpSession miSesion=null;
    public PedidosServlet() {
        super();
    }
    public void destroy() {
    	
    try {
		C.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		miSesion = request.getSession();
		 String user= miSesion.getAttribute("usuario").toString();
		 String contra = miSesion.getAttribute("contra").toString();
		 //String evento= miSesion.getAttribute("activado").toString();
		String id= request.getParameter("aux");
		try {
			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
						user,contra);
			 String query = "update tparg.pedido set horaEntrega=current_time() where nroPedido=?;";
				PreparedStatement pstmt = C.prepareStatement(query);
				
				pstmt.setString(1, id);
				

				pstmt.executeUpdate();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		response.sendRedirect("PedidosPorEntregar.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		miSesion = request.getSession();
		 String user= miSesion.getAttribute("usuario").toString();
		 String contra = miSesion.getAttribute("contra").toString();
		 String evento= miSesion.getAttribute("activado").toString();
		try {
			String id= request.getParameter("idsHidden");
			String[] ids =	id.split("\\s*,\\s*");
			String cantidad = request.getParameter("cantidadesHidden");
			String[] cantidades =	cantidad.split("\\s*,\\s*");
			String mozo = request.getParameter("mozo");
			String mesa =request.getParameter("mesa");
			//String evento= request.getParameter("evento");
			String total= request.getParameter("tot");
			String idPedido=null;
			
//			System.out.println("Total: " + total);
//			System.out.println("Mozo: " + mozo);
//			System.out.println("Mesa: " + mesa);
//			System.out.println("Evento: " + evento);

			 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					 user,contra);
			
//			String query = "insert into tparg.pedido (total,nroMesa,idMozo,pedidoIdEvento,horaEntrega) values (?,?,?,?,null);" ;	
//			
//			PreparedStatement pstmt = C.prepareStatement(query);
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
			System.out.println("idPedido = " + idPedido);
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
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			response.sendRedirect("PedidosPorEntregar.jsp");

			
		}
		
	}

}
