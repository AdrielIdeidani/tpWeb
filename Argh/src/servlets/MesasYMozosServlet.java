package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MesasYMozosServlet
 */
@WebServlet("/MesasYMozosServlet")
public class MesasYMozosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection C=null;
	PreparedStatement pstmt =null;
	ResultSet rs=null;
	HttpSession miSesion=null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MesasYMozosServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		 miSesion = request.getSession();
		 String user= miSesion.getAttribute("usuario").toString();
		 String contra = miSesion.getAttribute("contra").toString();
		 String evento = miSesion.getAttribute("activado").toString();
			String action = request.getParameter("auction");
			String tabla = request.getParameter("tabla");
			if(action!=null && action.contains("Insert")) {
				
				if(tabla.contains("Mozo")) {
					try {
						 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
								user,contra);
						
						String query = "Insert into tparg.mozo (apellido,nombre,mozoIdEvento) values (?,?,?);";
						PreparedStatement pstmt = C.prepareStatement(query);
						
						pstmt.setString(1, request.getParameter("apellido"));
						pstmt.setString(2, request.getParameter("nombre"));
						pstmt.setString(3, evento  );//request.getParameter("idEventoActivo")

						pstmt.executeUpdate();
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}

				}//Termina if de insert mozo
				else if (tabla.contains("Mesa")) {
					try {
						 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
								 user,contra);
						
						String query = "Insert into tparg.mesa (cantidadPersonas,mesaIdEvento,estado) values (?,?,null);";
						PreparedStatement pstmt = C.prepareStatement(query);
						
						pstmt.setString(1, request.getParameter("capacidad"));
						pstmt.setString(2, evento); // request.getParameter("idEventoActivo")

						pstmt.executeUpdate();
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
					
				}//Fin insert mesa
				
				
				
			}
			else if(action!=null && action.contains("EliminarMesa")) {
				try {
					 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
							 user,contra);
					
					 String id=request.getParameter("aux");
						//System.out.println("llega al borrar mesa! " +  request.getParameter("aux"));
					String query = "delete from  tparg.mesa where nroMesa=?";
					PreparedStatement pstmt = C.prepareStatement(query);
					
					pstmt.setString(1, id);
					

					pstmt.executeUpdate();
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				

				
			}
			else if(request.getParameter("auction2").contains("EliminarMozo")) {
				try {
					 C = DriverManager.getConnection("jdbc:mysql://localhost:3306/tparg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
							 user,contra);
					
					String id= request.getParameter("aux2");
						//System.out.println("llega al borrar mesa! " +  request.getParameter("aux"));
					String query = "delete from  tparg.mozo where idMozo=?;";
					PreparedStatement pstmt = C.prepareStatement(query);
					
					pstmt.setString(1, id);
					

					pstmt.executeUpdate();
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				//System.out.println("llega al borrar mozo! " + request.getParameter("aux2"));

				
			}
			response.sendRedirect("MesasYMozos.jsp");

	}

}
