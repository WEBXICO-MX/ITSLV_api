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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
@Entity
@Table(name = "carreras")
public class Carrera {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nombre;
	@ManyToOne
	@JoinColumn(name = "division_id")
	private Division division_id;
	private String icono;
	private String img;
	private String url;
	private String informacion_extra;
	private Timestamp fecha_registro;
	private Timestamp fecha_modificacion;
	private boolean activo;
	@JsonIgnore
	@OneToMany(mappedBy = "carrera_id", cascade = CascadeType.ALL)
	private List<Materia> materias;

	public Carrera() {
		this.id = 0;
		this.nombre = "";
		this.division_id = null;
		this.icono = "";
		this.img = "";
		this.url = "";
		this.informacion_extra = "";
		this.fecha_registro = null;
		this.fecha_modificacion = null;
		this.activo = true;
		this.materias = null;
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

	public String getIcono() {
		return icono;
	}

	public void setIcono(String icono) {
		this.icono = icono;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getInformacion_extra() {
		return informacion_extra;
	}

	public void setInformacion_extra(String informacion_extra) {
		this.informacion_extra = informacion_extra;
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

	public List<Materia> getMaterias() {
		return materias;
	}

	public void setMaterias(List<Materia> materias) {
		this.materias = materias;
	}

	@Override
	public String toString() {
		return "Carrera [id=" + id + ", nombre=" + nombre + ", division_id=" + division_id + ", icono=" + icono
				+ ", img=" + img + ", url=" + url + ", informacion_extra=" + informacion_extra + ", fecha_registro="
				+ fecha_registro + ", fecha_modificacion=" + fecha_modificacion + ", activo=" + activo + "]";
	}

}
