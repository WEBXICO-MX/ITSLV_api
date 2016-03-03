/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mx.edu.itslv.spring.dao.DirectorioDAO;
import mx.edu.itslv.spring.model.Directorio;

@Service
public class DirectorioServiceImpl implements DirectorioService {
	private DirectorioDAO directorioDAO;

	public void setDirectorioDAO(DirectorioDAO directorioDAO) {
		this.directorioDAO = directorioDAO;
	}

	@Override
	@Transactional
	public void addDirectorio(Directorio d) {
		this.directorioDAO.addDirectorio(d);

	}

	@Override
	@Transactional
	public void updateDirectorio(Directorio d) {
		this.directorioDAO.updateDirectorio(d);

	}

	@Override
	@Transactional
	public List<Directorio> listDirectorio() {
		// TODO Auto-generated method stub
		return this.directorioDAO.listDirectorio();
	}

	@Override
	@Transactional
	public Directorio getDirectorioById(int id) {
		// TODO Auto-generated method stub
		return this.directorioDAO.getDirectorioById(id);
	}

	@Override
	@Transactional
	public void removeDirectorio(int id) {
		this.directorioDAO.removeDirectorio(id);

	}

}
