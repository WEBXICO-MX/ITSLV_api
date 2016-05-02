/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.dao;

import java.util.List;

import mx.edu.itslv.spring.model.Division;

public interface DivisionDAO {
	public void addDivision(Division d);

	public void updateDivision(Division d);

	public List<Division> listDivision();
	
	public List<Division> listDivisionByActivo(boolean activo);

	public Division getDivisionById(int id);

	public void removeDivision(int id);

}
