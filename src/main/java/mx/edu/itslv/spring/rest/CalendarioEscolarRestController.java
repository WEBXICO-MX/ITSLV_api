package mx.edu.itslv.spring.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import mx.edu.itslv.spring.model.CalendarioEscolar;
import mx.edu.itslv.spring.service.CalendarioEscolarService;

@RestController
public class CalendarioEscolarRestController {

	private CalendarioEscolarService calendarioEscolarService;

	@Autowired(required = true)
	@Qualifier(value = "calendarioEscolarService")
	public void setCalendarioEscolarService(CalendarioEscolarService actividadUniversitariaService) {
		this.calendarioEscolarService = actividadUniversitariaService;
	}

	@RequestMapping(value = "/rest/calendarioescolar", method = RequestMethod.GET)
	public ResponseEntity<List<CalendarioEscolar>> listAllCalendarioEscolar() {
		List<CalendarioEscolar> listCalendarioEscolar = calendarioEscolarService.listCalendarioEscolarByActivo(true);
		if (listCalendarioEscolar.isEmpty()) {
			return new ResponseEntity<List<CalendarioEscolar>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CalendarioEscolar>>(listCalendarioEscolar, HttpStatus.OK);
	}

}
