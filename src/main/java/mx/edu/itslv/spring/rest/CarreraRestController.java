/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import mx.edu.itslv.spring.model.Carrera;
import mx.edu.itslv.spring.service.CarreraService;

@RestController
public class CarreraRestController {
	private CarreraService carreraService;

	@Autowired(required = true)
	@Qualifier(value = "carreraService")
	public void setCarreraService(CarreraService carreraService) {
		this.carreraService = carreraService;
	}

	@RequestMapping(value = "/rest/carreras", method = RequestMethod.GET)
	public ResponseEntity<List<Carrera>> listAllCarrera() {
		List<Carrera> listCarrera = carreraService.listCarrera();
		if (listCarrera.isEmpty()) {
			return new ResponseEntity<List<Carrera>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Carrera>>(listCarrera, HttpStatus.OK);
	}
}
