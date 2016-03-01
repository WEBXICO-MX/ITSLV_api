/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mx.edu.itslv.spring.dao.AreaDAO;
import mx.edu.itslv.spring.model.Area;

@Service
public class AreaServiceImpl implements AreaService {
	private AreaDAO areaDAO;

	public void setAreaDAO(AreaDAO areaDAO) {
		this.areaDAO = areaDAO;
	}

	@Override
	@Transactional
	public void addArea(Area a) {
		this.areaDAO.addArea(a);

	}

	@Override
	@Transactional
	public void updateArea(Area a) {
		this.areaDAO.updateArea(a);

	}

	@Override
	@Transactional
	public List<Area> listArea() {
		// TODO Auto-generated method stub
		return this.areaDAO.listArea();
	}

	@Override
	@Transactional
	public Area getAreaById(int id) {
		// TODO Auto-generated method stub
		return this.areaDAO.getAreaById(id);
	}

	@Override
	@Transactional
	public void removeArea(int id) {
		this.areaDAO.removeArea(id);

	}

}
