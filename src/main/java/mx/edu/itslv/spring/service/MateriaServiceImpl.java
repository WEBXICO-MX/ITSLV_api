/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mx.edu.itslv.spring.dao.MateriaDAO;
import mx.edu.itslv.spring.model.Materia;

@Service
public class MateriaServiceImpl implements MateriaService {
	private MateriaDAO materiaDAO;

	public void setMateriaDAO(MateriaDAO materiaDAO) {
		this.materiaDAO = materiaDAO;
	}

	@Override
	@Transactional
	public void addMateria(Materia m) {
		this.materiaDAO.addMateria(m);

	}

	@Override
	@Transactional
	public void updateMateria(Materia m) {
		this.materiaDAO.updateMateria(m);

	}

	@Override
	@Transactional
	public List<Materia> listMateria() {
		// TODO Auto-generated method stub
		return this.materiaDAO.listMateria();
	}

	@Override
	@Transactional
	public Materia getMateriaById(int id) {
		// TODO Auto-generated method stub
		return this.materiaDAO.getMateriaById(id);
	}

	@Override
	@Transactional
	public void removeMateria(int id) {
		this.materiaDAO.removeMateria(id);

	}

}
