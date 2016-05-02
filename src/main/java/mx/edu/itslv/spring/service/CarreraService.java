/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import mx.edu.itslv.spring.model.Carrera;

public interface CarreraService {
	public void addCarrera(Carrera c);

	public void updateCarrera(Carrera c);

	public List<Carrera> listCarrera();

	public List<Carrera> listCarreraByActivo(boolean activo);

	public Carrera getCarreraById(int id);

	public void removeCarrera(int id);

}
