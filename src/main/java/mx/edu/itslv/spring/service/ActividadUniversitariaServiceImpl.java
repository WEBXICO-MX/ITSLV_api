/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mx.edu.itslv.spring.dao.ActividadUniversitariaDAO;
import mx.edu.itslv.spring.model.ActividadUniversitaria;

@Service
public class ActividadUniversitariaServiceImpl implements ActividadUniversitariaService {
	private ActividadUniversitariaDAO actividadUniversitariaDAO;

	public void setActividadUniversitariaDAO(ActividadUniversitariaDAO actividadUniversitariaDAO) {
		this.actividadUniversitariaDAO = actividadUniversitariaDAO;
	}

	@Override
	@Transactional
	public void addActividadUniversitaria(ActividadUniversitaria a) {
		this.actividadUniversitariaDAO.addActividadUniversitaria(a);

	}

	@Override
	@Transactional
	public void updateActividadUniversitaria(ActividadUniversitaria a) {
		this.actividadUniversitariaDAO.updateActividadUniversitaria(a);

	}

	@Override
	@Transactional
	public List<ActividadUniversitaria> listActividadUniversitaria() {
		// TODO Auto-generated method stub
		return this.actividadUniversitariaDAO.listActividadUniversitaria();
	}

	@Override
	@Transactional
	public List<ActividadUniversitaria> listActividadUniversitariaByActivo(boolean activo) {
		// TODO Auto-generated method stub
		return this.actividadUniversitariaDAO.listActividadUniversitariaByActivo(activo);
	}

	@Override
	@Transactional
	public ActividadUniversitaria getActividadUniversitariaById(int id) {
		// TODO Auto-generated method stub
		return this.actividadUniversitariaDAO.getActividadUniversitariaById(id);
	}

	@Override
	@Transactional
	public void removeActividadUniversitaria(int id) {
		// TODO Auto-generated method stub
		this.actividadUniversitariaDAO.removeActividadUniversitaria(id);

	}

}
