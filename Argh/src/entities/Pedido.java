package entities;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;

public class Pedido {
	private int nroPedido, idMesa, idMozo;
	//private String estado;
	private Time horaEntrega;
	
	private ArrayList<LineaPedido> lineasPedido;
	private float total;
	
	//Getters & Setters
	public int getNroPedido() {
		return nroPedido;
	}
	public void setNroPedido(int nroPedido) {
		this.nroPedido = nroPedido;
	}
//	public String getEstado() {
//		return estado;
//	}
//	public void setEstado(String estado) {
//		this.estado = estado;
//	}
	
	public int getIdMesa() {
		return idMesa;
	}
	public Time getHoraEntrega() {
		return horaEntrega;
	}
	public void setHoraEntrega(Time horaEntrega) {
		this.horaEntrega = horaEntrega;
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
