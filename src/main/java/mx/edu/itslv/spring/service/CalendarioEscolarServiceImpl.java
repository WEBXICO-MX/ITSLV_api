package mx.edu.itslv.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mx.edu.itslv.spring.dao.CalendarioEscolarDAO;
import mx.edu.itslv.spring.model.CalendarioEscolar;

@Service
public class CalendarioEscolarServiceImpl implements CalendarioEscolarService {
	private CalendarioEscolarDAO calendarioEscolarDAO;

	public void setCalendarioEscolarDAO(CalendarioEscolarDAO calendarioEscolarDAO) {
		this.calendarioEscolarDAO = calendarioEscolarDAO;
	}

	@Override
	@Transactional
	public void addCalendarioEscolar(CalendarioEscolar ce) {
		this.calendarioEscolarDAO.addCalendarioEscolar(ce);

	}

	@Override
	@Transactional
	public void updateCalendarioEscolar(CalendarioEscolar ce) {
		this.calendarioEscolarDAO.updateCalendarioEscolar(ce);

	}

	@Override
	@Transactional
	public List<CalendarioEscolar> listCalendarioEscolar() {
		// TODO Auto-generated method stub
		return this.calendarioEscolarDAO.listCalendarioEscolar();
	}

	@Override
	@Transactional
	public List<CalendarioEscolar> listCalendarioEscolarByActivo(boolean activo) {
		// TODO Auto-generated method stub
		return this.calendarioEscolarDAO.listCalendarioEscolarByActivo(activo);
	}

	@Override
	@Transactional
	public CalendarioEscolar getCalendarioEscolarById(int id) {
		// TODO Auto-generated method stub
		return this.calendarioEscolarDAO.getCalendarioEscolarById(id);
	}

	@Override
	@Transactional
	public void removeCalendarioEscolar(int id) {
		this.calendarioEscolarDAO.removeCalendarioEscolar(id);

	}

}
