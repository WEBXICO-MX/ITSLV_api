/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.dao;

import java.util.List;

import mx.edu.itslv.spring.model.Area;

public interface AreaDAO {

	public void addArea(Area a);

	public void updateArea(Area a);

	public List<Area> listArea();
	
	public List<Area> listAreaByActivo(boolean activo);

	public Area getAreaById(int id);

	public void removeArea(int id);
}
