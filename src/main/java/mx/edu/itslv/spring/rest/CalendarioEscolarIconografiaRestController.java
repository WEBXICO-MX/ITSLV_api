package mx.edu.itslv.spring.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import mx.edu.itslv.spring.model.CalendarioEscolarIconografia;
import mx.edu.itslv.spring.service.CalendarioEscolarIconografiaService;

@RestController
public class CalendarioEscolarIconografiaRestController {

	private CalendarioEscolarIconografiaService calendarioEscolarIconografiaService;

	@Autowired(required = true)
	@Qualifier(value = "calendarioEscolarIconografiaService")
	public void setCalendarioEscolarIconografiaService(CalendarioEscolarIconografiaService actividadUniversitariaService) {
		this.calendarioEscolarIconografiaService = actividadUniversitariaService;
	}

	@RequestMapping(value = "/rest/calendarioescolariconografia", method = RequestMethod.GET)
	public ResponseEntity<List<CalendarioEscolarIconografia>> listAllCalendarioEscolarIconografia() {
		List<CalendarioEscolarIconografia> listCalendarioEscolarIconografia = calendarioEscolarIconografiaService.listCalendarioEscolarIconografiaByActivo(true);
		if (listCalendarioEscolarIconografia.isEmpty()) {
			return new ResponseEntity<List<CalendarioEscolarIconografia>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CalendarioEscolarIconografia>>(listCalendarioEscolarIconografia, HttpStatus.OK);
	}

}
