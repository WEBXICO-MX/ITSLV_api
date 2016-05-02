/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.dao;

import java.util.List;

import mx.edu.itslv.spring.model.Servicio;

public interface ServicioDAO {
	public void addServicio(Servicio s);

	public void updateServicio(Servicio s);

	public List<Servicio> listServicio();

	public List<Servicio> listServicioByActivo(boolean activo);

	public Servicio getServicioById(int id);

	public void removeServicio(int id);
}
