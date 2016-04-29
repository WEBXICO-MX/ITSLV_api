/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import mx.edu.itslv.spring.model.Materia;

public interface MateriaService {
	public void addMateria(Materia m);

	public void updateMateria(Materia m);

	public List<Materia> listMateria();
	
	public List<Materia> listMateriaByCarreraSemestre(int carrera, int semestre);

	public Materia getMateriaById(int id);

	public void removeMateria(int id);

}
