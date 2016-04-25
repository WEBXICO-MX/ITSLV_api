/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Entity
@Table(name = "divisiones")
public class Division {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nombre;
	private Timestamp fecha_registro;
	private Timestamp fecha_modificacion;
	private boolean activo;
	@JsonIgnore
	@OneToMany(mappedBy = "division_id", cascade = CascadeType.ALL)
	private List<Carrera> carreras;

	public Division() {
		this.id = 0;
		this.nombre = "";
		this.fecha_registro = null;
		this.fecha_modificacion = null;
		this.activo = true;
		this.carreras = null;
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

	public List<Carrera> getCarreras() {
		return carreras;
	}

	public void setCarreras(List<Carrera> carreras) {
		this.carreras = carreras;
	}

	@Override
	public String toString() {
		return "Division [id=" + id + ", nombre=" + nombre + ", fecha_registro=" + fecha_registro
				+ ", fecha_modificacion=" + fecha_modificacion + ", activo=" + activo + "]";
	}

}
