/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mx.edu.itslv.spring.dao.CarreraDAO;
import mx.edu.itslv.spring.model.Carrera;

@Service
public class CarreraServiceImpl implements CarreraService {
	private CarreraDAO carreraDAO;

	public void setCarreraDAO(CarreraDAO carreraDAO) {
		this.carreraDAO = carreraDAO;
	}

	@Override
	@Transactional
	public void addCarrera(Carrera c) {
		this.carreraDAO.addCarrera(c);

	}

	@Override
	@Transactional
	public void updateCarrera(Carrera c) {
		this.carreraDAO.updateCarrera(c);

	}

	@Override
	@Transactional
	public List<Carrera> listCarrera() {
		// TODO Auto-generated method stub
		return this.carreraDAO.listCarrera();
	}

	@Override
	@Transactional
	public List<Carrera> listCarreraByActivo(boolean activo) {
		// TODO Auto-generated method stub
		return this.carreraDAO.listCarreraByActivo(activo);
	}

	@Override
	@Transactional
	public Carrera getCarreraById(int id) {
		// TODO Auto-generated method stub
		return this.carreraDAO.getCarreraById(id);
	}

	@Override
	@Transactional
	public void removeCarrera(int id) {
		this.carreraDAO.removeCarrera(id);

	}

}
