package entities;

public class LineaPedido {
	private Producto prod;
	private int cant;
	
	//Getters & Setters
	public Producto getProd() {
		return prod;
	}
	public void setProd(Producto prod) {
		this.prod = prod;
	}
	public int getCant() {
		return cant;
	}
	public void setCant(int cant) {
		this.cant = cant;
	}
	
	//Métodos
	public float calcularSubTotal() {
		float subtotal =0;
		subtotal= prod.getPrecio()*this.getCant();
		return subtotal;
	}
	
}
