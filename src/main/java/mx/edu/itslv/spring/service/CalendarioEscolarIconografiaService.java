package mx.edu.itslv.spring.service;

import java.util.List;

import mx.edu.itslv.spring.model.CalendarioEscolarIconografia;

public interface CalendarioEscolarIconografiaService {
	
	public void addCalendarioEscolarIconografia(CalendarioEscolarIconografia cei);

	public void updateCalendarioEscolarIconografia(CalendarioEscolarIconografia cei);

	public List<CalendarioEscolarIconografia> listCalendarioEscolarIconografia();
	
	public List<CalendarioEscolarIconografia> listCalendarioEscolarIconografiaByActivo(boolean activo);

	public CalendarioEscolarIconografia getCalendarioEscolarIconografiaById(int id);

	public void removeCalendarioEscolarIconografia(int id);

}
