package mx.edu.itslv.spring.dao;

import java.util.List;

import mx.edu.itslv.spring.model.CalendarioEscolar;

public interface CalendarioEscolarDAO {

	public void addCalendarioEscolar(CalendarioEscolar ce);

	public void updateCalendarioEscolar(CalendarioEscolar ce);

	public List<CalendarioEscolar> listCalendarioEscolar();

	public List<CalendarioEscolar> listCalendarioEscolarByActivo(boolean activo);

	public CalendarioEscolar getCalendarioEscolarById(int id);

	public void removeCalendarioEscolar(int id);

}
