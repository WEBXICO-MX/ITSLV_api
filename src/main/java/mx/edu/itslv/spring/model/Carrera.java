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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "carreras")
public class Carrera {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nombre;
	@ManyToOne
	@JoinColumn(name="division_id")
	private Division division_id;
	private Date fecha_registro;
	private Date fecha_modificacion;
	private boolean activo;

	public Carrera() {
		this.id = 0;
		this.nombre = "";
		this.division_id = null;
		this.fecha_registro = null;
		this.fecha_modificacion = null;
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

	public Division getDivision_id() {
		return division_id;
	}

	public void setDivision_id(Division division_id) {
		this.division_id = division_id;
	}

	public Date getFecha_registro() {
		return fecha_registro;
	}

	public void setFecha_registro(Date fecha_registro) {
		this.fecha_registro = fecha_registro;
	}

	public Date getFecha_modificacion() {
		return fecha_modificacion;
	}

	public void setFecha_modificacion(Date fecha_modificacion) {
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
		return "Carrera [id=" + id + ", nombre=" + nombre + ", division_id=" + division_id + ", fecha_registro="
				+ fecha_registro + ", fecha_modificacion=" + fecha_modificacion + ", activo=" + activo + "]";
	}

}
