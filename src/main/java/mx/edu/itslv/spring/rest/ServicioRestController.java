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

import mx.edu.itslv.spring.model.Servicio;
import mx.edu.itslv.spring.service.ServicioService;

@RestController
public class ServicioRestController {
	private ServicioService servicioService;

	@Autowired(required = true)
	@Qualifier(value = "servicioService")
	public void setServicioService(ServicioService servicioService) {
		this.servicioService = servicioService;
	}

	@RequestMapping(value = "/rest/servicios", method = RequestMethod.GET)
	public ResponseEntity<List<Servicio>> listAllServicio() {
		List<Servicio> listServicio = servicioService.listServicioByActivo(true);
		if (listServicio.isEmpty()) {
			return new ResponseEntity<List<Servicio>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Servicio>>(listServicio, HttpStatus.OK);
	}

}
