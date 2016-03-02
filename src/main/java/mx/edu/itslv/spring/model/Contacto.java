/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "contactos")
public class Contacto {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nombre;
	private String contenido;
	private Date fecha_modificacion;
	private Date fecha_registro;
	private boolean activo;

	public Contacto() {
		this.id = 0;
		this.nombre = "";
		this.contenido = "";
		this.fecha_modificacion = null;
		this.fecha_registro = null;
		this.activo = true;
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

	public String getContenido() {
		return contenido;
	}

	public void setContenido(String contenido) {
		this.contenido = contenido;
	}

	public Date getFecha_modificacion() {
		return fecha_modificacion;
	}

	public void setFecha_modificacion(Date fecha_modificacion) {
		this.fecha_modificacion = fecha_modificacion;
	}

	public Date getFecha_registro() {
		return fecha_registro;
	}

	public void setFecha_registro(Date fecha_registro) {
		this.fecha_registro = fecha_registro;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	@Override
	public String toString() {
		return "Contacto [id=" + id + ", nombre=" + nombre + ", contenido=" + contenido + ", fecha_modificacion="
				+ fecha_modificacion + ", fecha_registro=" + fecha_registro + ", activo=" + activo + "]";
	}

}
