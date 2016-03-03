/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.dao;

import java.util.List;

import mx.edu.itslv.spring.model.Carrera;

public interface CarreraDAO {
	public void addCarrera(Carrera c);

	public void updateCarrera(Carrera c);

	public List<Carrera> listCarrera();

	public Carrera getCarreraById(int id);

	public void removeCarrera(int id);

}
