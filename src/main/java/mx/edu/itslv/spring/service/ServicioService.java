/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import mx.edu.itslv.spring.model.Servicio;

public interface ServicioService {
	public void addServicio(Servicio s);

	public void updateServicio(Servicio s);

	public List<Servicio> listServicio();

	public Servicio getServicioById(int id);

	public void removeServicio(int id);

}
