/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mx.edu.itslv.spring.dao.ServicioDAO;
import mx.edu.itslv.spring.model.Servicio;

@Service
public class ServicioServiceImpl implements ServicioService {
	private ServicioDAO servicioDAO;

	public void setServicioDAO(ServicioDAO servicioDAO) {
		this.servicioDAO = servicioDAO;
	}

	@Override
	@Transactional
	public void addServicio(Servicio s) {
		this.servicioDAO.addServicio(s);

	}

	@Override
	@Transactional
	public void updateServicio(Servicio s) {
		this.servicioDAO.updateServicio(s);

	}

	@Override
	@Transactional
	public List<Servicio> listServicio() {
		// TODO Auto-generated method stub
		return this.servicioDAO.listServicio();
	}

	@Override
	@Transactional
	public Servicio getServicioById(int id) {
		// TODO Auto-generated method stub
		return this.servicioDAO.getServicioById(id);
	}

	@Override
	@Transactional
	public void removeServicio(int id) {
		this.servicioDAO.removeServicio(id);

	}

}
