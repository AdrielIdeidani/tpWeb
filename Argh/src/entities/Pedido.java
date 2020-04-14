package entities;

import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;

import com.mysql.cj.result.LocalTimeValueFactory;


public class Pedido {
	private int nroPedido, idMesa, idMozo;
	//private String estado;
	private LocalTime horaEntrega;
	
	private ArrayList<LineaPedido> lineasPedido;
	private float total;
	

	public int getNroPedido() {
		return nroPedido;
	}
	public void setNroPedido(int nroPedido) {
		this.nroPedido = nroPedido;
	}
	
	public int getIdMesa() {
		return idMesa;
	}
	public LocalTime getHoraEntrega() {
		return horaEntrega;
	}
	public void setHoraEntrega(Time horaEntrega) {
		
		LocalTime aux= horaEntrega.toLocalTime();
		aux=aux.plusHours(3);		
		this.horaEntrega = aux;
	}
	public void setIdMesa(int idMesa) {
		this.idMesa = idMesa;
	}
	public int getIdMozo() {
		return idMozo;
	}
	public void setIdMozo(int idMozo) {
		this.idMozo = idMozo;
	}
	public ArrayList<LineaPedido> getLineasPedido() {
		return lineasPedido;
	}
	public void setPedidos(ArrayList<LineaPedido> lineasPedido) {
		this.lineasPedido = lineasPedido;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	
	//Métodos
	public void calcularTotal() {
		total = 0;
		for(LineaPedido lp: lineasPedido) {
			total=+ lp.calcularSubTotal();
		}
	}
	
}
