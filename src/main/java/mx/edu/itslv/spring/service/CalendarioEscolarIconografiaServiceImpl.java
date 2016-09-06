package mx.edu.itslv.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mx.edu.itslv.spring.dao.CalendarioEscolarIconografiaDAO;
import mx.edu.itslv.spring.model.CalendarioEscolarIconografia;

@Service
public class CalendarioEscolarIconografiaServiceImpl implements CalendarioEscolarIconografiaService {
	private CalendarioEscolarIconografiaDAO calendarioEscolarIconografiaDAO;

	public void setCalendarioEscolarIconografiaDAO(CalendarioEscolarIconografiaDAO calendarioEscolarIconografiaDAO) {
		this.calendarioEscolarIconografiaDAO = calendarioEscolarIconografiaDAO;
	}

	@Override
	@Transactional
	public void addCalendarioEscolarIconografia(CalendarioEscolarIconografia ce) {
		this.calendarioEscolarIconografiaDAO.addCalendarioEscolarIconografia(ce);

	}

	@Override
	@Transactional
	public void updateCalendarioEscolarIconografia(CalendarioEscolarIconografia ce) {
		this.calendarioEscolarIconografiaDAO.updateCalendarioEscolarIconografia(ce);

	}

	@Override
	@Transactional
	public List<CalendarioEscolarIconografia> listCalendarioEscolarIconografia() {
		// TODO Auto-generated method stub
		return this.calendarioEscolarIconografiaDAO.listCalendarioEscolarIconografia();
	}

	@Override
	@Transactional
	public List<CalendarioEscolarIconografia> listCalendarioEscolarIconografiaByActivo(boolean activo) {
		// TODO Auto-generated method stub
		return this.calendarioEscolarIconografiaDAO.listCalendarioEscolarIconografiaByActivo(activo);
	}

	@Override
	@Transactional
	public CalendarioEscolarIconografia getCalendarioEscolarIconografiaById(int id) {
		// TODO Auto-generated method stub
		return this.calendarioEscolarIconografiaDAO.getCalendarioEscolarIconografiaById(id);
	}

	@Override
	@Transactional
	public void removeCalendarioEscolarIconografia(int id) {
		this.calendarioEscolarIconografiaDAO.removeCalendarioEscolarIconografia(id);

	}

}
