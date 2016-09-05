package mx.edu.itslv.spring.service;

import java.util.List;

import mx.edu.itslv.spring.model.CalendarioEscolar;

public interface CalendarioEscolarService {
	
	public void addCalendarioEscolar(CalendarioEscolar ce);

	public void updateCalendarioEscolar(CalendarioEscolar ce);

	public List<CalendarioEscolar> listCalendarioEscolar();
	
	public List<CalendarioEscolar> listCalendarioEscolarByActivo(boolean activo);

	public CalendarioEscolar getCalendarioEscolarById(int id);

	public void removeCalendarioEscolar(int id);

}
