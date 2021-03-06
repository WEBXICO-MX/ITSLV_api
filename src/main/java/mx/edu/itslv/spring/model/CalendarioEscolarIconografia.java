package mx.edu.itslv.spring.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
@Entity
@Table(name = "calendario_escolar_iconografia")
public class CalendarioEscolarIconografia {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nombre;
	private String img;
	private Timestamp fecha_registro;
	private Timestamp fecha_modificacion;
	private boolean activo;
	
	public CalendarioEscolarIconografia() {
		this.id = 0;
		this.nombre = "";
		this.img = "";
		this.fecha_registro = null;
		this.fecha_modificacion = null;
		this.activo = false;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Timestamp getFecha_registro() {
		return fecha_registro;
	}

	public void setFecha_registro(Timestamp fecha_registro) {
		this.fecha_registro = fecha_registro;
	}

	public Timestamp getFecha_modificacion() {
		return fecha_modificacion;
	}

	public void setFecha_modificacion(Timestamp fecha_modificacion) {
		this.fecha_modificacion = fecha_modificacion;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	@Override
	public String toString() {
		return "CalendarioEscolarIconografia [id=" + id + ", nombre=" + nombre + ", img=" + img + ", fecha_registro="
				+ fecha_registro + ", fecha_modificacion=" + fecha_modificacion + ", activo=" + activo + "]";
	}
	
	

}
