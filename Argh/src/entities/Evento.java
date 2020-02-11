package entities;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Evento {
	private int	id;
	private Date fecha;
	private String desc;
	private ArrayList<Mesas> mesas;
	private ArrayList<Mozo> mozos;
	private ArrayList<Producto> productos;
	
	//Getters & Setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public ArrayList<Mesas> getMesas() {
		return mesas;
	}
	public void setMesas(ArrayList<Mesas> mesas) {
		this.mesas = mesas;
	}
	public ArrayList<Mozo> getMozos() {
		return mozos;
	}
	public void setMozos(ArrayList<Mozo> mozos) {
		this.mozos = mozos;
	}
	public ArrayList<Producto> getProductos() {
		return productos;
	}
	public void setProductos(ArrayList<Producto> productos) {
		this.productos = productos;
	}
		
	//Métodos 
	public String getDia() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd");
		String dia = sdf.format(fecha);
		return dia;
	}
	public String getMes() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM");
		String mes = sdf.format(fecha);
		return mes;
	}
	public String getAño() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String año = sdf.format(fecha);
		return año;
	}
	
	public float cerrarCaja(ArrayList<Mesas> mesas) {
		float total=0;
		for(Mesas m: mesas) {
			ArrayList<Pedido> pedidos = m.getPedidos();
			for(Pedido p: pedidos) {
				total+= p.getTotal();
			}
		}
		return total;
	}
}
