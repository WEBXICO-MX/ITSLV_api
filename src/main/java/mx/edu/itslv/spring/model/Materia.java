/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Entity
@Table(name = "materias")
public class Materia {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nombre;
	private int grado;
	@ManyToOne
	@JoinColumn(name="carrera_id")
	private Carrera carrera_id;
	private Timestamp fecha_registro;
	private Timestamp fecha_modificacion;
	private boolean activo;

	public Materia() {
		this.id = 0;
		this.nombre = "";
		this.grado = 0;
		this.carrera_id = null;
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

	public int getGrado() {
		return grado;
	}

	public void setGrado(int grado) {
		this.grado = grado;
	}

	public Carrera getCarrera_id() {
		return carrera_id;
	}

	public void setCarrera_id(Carrera carrera_id) {
		this.carrera_id = carrera_id;
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
		return "Materia [id=" + id + ", nombre=" + nombre + ", grado=" + grado + ", carrera_id=" + carrera_id
				+ ", fecha_registro=" + fecha_registro + ", fecha_modificacion=" + fecha_modificacion + ", activo="
				+ activo + "]";
	}

}
