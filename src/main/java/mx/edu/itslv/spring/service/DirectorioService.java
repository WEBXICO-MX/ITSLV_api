/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import mx.edu.itslv.spring.model.Directorio;

public interface DirectorioService {
	public void addDirectorio(Directorio d);

	public void updateDirectorio(Directorio d);

	public List<Directorio> listDirectorio();
	
	public List<Directorio> listDirectorioByArea(int area_id);

	public List<Directorio> listDirectorioByActivo(boolean activo);

	public Directorio getDirectorioById(int id);

	public void removeDirectorio(int id);

}
