package entities;

public class ProdPorEntregar {
	String id,nombre,mozoMesa;
	int cant;
	public ProdPorEntregar(){
		this.mozoMesa=" ";
		this.cant=0;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getMozoMesa() {
		return mozoMesa;
	}
	public void setMozoMesa(String mozoMesa) {
		this.mozoMesa=this.mozoMesa.concat(mozoMesa);
	}
	public int getCant() {
		return cant;
	}
	public void setCant(int cant) {
		this.cant += cant;
	}
	

}
