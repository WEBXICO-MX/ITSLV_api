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
@Table(name = "actividades_universitarias")
public class ActividadUniversitaria {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nombre;
	private String texto_previo;
	private String texto_completo;
	private String img;
	private String link;
	private Date fecha_registro;
	private Date fecha_realizacion;
	private Date fecha_modificacion;
	private boolean activo;

	public ActividadUniversitaria() {
		this.id = 0;
		this.nombre = "";
		this.texto_previo = "";
		this.texto_completo = "";
		this.img = "";
		this.link = "";
		this.fecha_registro = null;
		this.fecha_realizacion = null;
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

	public String getTexto_previo() {
		return texto_previo;
	}

	public void setTexto_previo(String texto_previo) {
		this.texto_previo = texto_previo;
	}

	public String getTexto_completo() {
		return texto_completo;
	}

	public void setTexto_completo(String texto_completo) {
		this.texto_completo = texto_completo;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Date getFecha_registro() {
		return fecha_registro;
	}

	public void setFecha_registro(Date fecha_registro) {
		this.fecha_registro = fecha_registro;
	}

	public Date getFecha_realizacion() {
		return fecha_realizacion;
	}

	public void setFecha_realizacion(Date fecha_realizacion) {
		this.fecha_realizacion = fecha_realizacion;
	}

	public Date getFecha_modificacion() {
		return this.fecha_modificacion;
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
		return "ActividadUniversitaria [id=" + id + ", nombre=" + nombre + ", texto_previo=" + texto_previo
				+ ", texto_completo=" + texto_completo + ", img=" + img + ", link=" + link + ", fecha_registro="
				+ fecha_registro + ", fecha_realizacion=" + fecha_realizacion + ", fecha_modificacion="
				+ fecha_modificacion + ", activo=" + activo + "]";
	}

}
