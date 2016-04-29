/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import mx.edu.itslv.spring.model.ActividadUniversitaria;

public interface ActividadUniversitariaService {
	public void addActividadUniversitaria(ActividadUniversitaria a);

	public void updateActividadUniversitaria(ActividadUniversitaria a);

	public List<ActividadUniversitaria> listActividadUniversitaria();
	
	public List<ActividadUniversitaria> listActividadUniversitariaByActivo(boolean activo);

	public ActividadUniversitaria getActividadUniversitariaById(int id);

	public void removeActividadUniversitaria(int id);

}
