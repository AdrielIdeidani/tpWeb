package entities;

import java.util.ArrayList;

public class Producto {
	void producto(){
		vendidos=0;
	}
	private int id, stockIni , vendidos;
	private String nombre;
	private float precio;
	//private ArrayList<LineaPedido> pedidos;
	
	//Getters & Setters
	public void vendidos(int x) {
		vendidos+=x;
	}
	public void setVendidos(int x) {
		vendidos=x;
	}
	public int getVendidos() {
		return vendidos;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStockIni() {
		return stockIni;
	}
	public void setStockIni(int stock) {
		this.stockIni = stock;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public float getPrecio() {
		return precio;
	}
	public void setPrecio(float precio) {
		this.precio = precio;
	}
//	public ArrayList<LineaPedido> getPedidos() {
//		return pedidos;
//	}
//	public void setPedidos(ArrayList<LineaPedido> pedidos) {
//		this.pedidos = pedidos;
//	}
//	
	//Métodos

}
