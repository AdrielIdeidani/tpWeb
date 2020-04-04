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

import logic.logicMesas;
import logic.logicMozos;

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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String aux=null;
		logicMesas lm = new logicMesas();
		logicMozos lmo=new logicMozos();
		 miSesion = request.getSession();
		 String user= miSesion.getAttribute("usuario").toString();
		 String contra = miSesion.getAttribute("contra").toString();
		 String evento = miSesion.getAttribute("activado").toString();
			String action = request.getParameter("auction");
			String tabla = request.getParameter("tabla");
			

			if(action!=null && action.contains("Insert")) {
				
				if(tabla.contains("Mozo")) {
					aux=lmo.agregar(user, contra,
							request.getParameter("apellido"),request.getParameter("nombre"),evento);
					

				}//Termina if de insert mozo
				else if (tabla.contains("Mesa")) {
					aux =lm.agregar(user, contra, request.getParameter("capacidad"),evento);
					
					
					
				}//Fin insert mesa
				
				
				
			}
			else if(action!=null && action.contains("EliminarMesa")) {
			aux=lm.eliminar(user,contra,request.getParameter("aux"));
				
				
				

				
			}
			else if(request.getParameter("auction2").contains("EliminarMozo")) {
				aux=lmo.eliminar(user, contra, request.getParameter("aux2"));
			
				//System.out.println("llega al borrar mozo! " + request.getParameter("aux2"));

				
			}
			if(aux==null) {
				response.sendRedirect("MesasYMozos.jsp");
			}
			else
			response.sendRedirect("MesasYMozos.jsp?control="+aux);

	}

}
