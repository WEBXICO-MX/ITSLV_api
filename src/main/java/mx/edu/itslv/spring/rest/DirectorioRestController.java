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

import mx.edu.itslv.spring.model.Directorio;
import mx.edu.itslv.spring.service.DirectorioService;

@RestController
public class DirectorioRestController {
	private DirectorioService directorioService;

	@Autowired(required = true)
	@Qualifier(value = "directorioService")
	public void setDirectorioService(DirectorioService directorioService) {
		this.directorioService = directorioService;
	}

	@RequestMapping(value = "/rest/directorios", method = RequestMethod.GET)
	public ResponseEntity<List<Directorio>> listAllDirectorio() {
		List<Directorio> listDirectorio = directorioService.listDirectorioByActivo(true);
		if (listDirectorio.isEmpty()) {
			return new ResponseEntity<List<Directorio>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Directorio>>(listDirectorio, HttpStatus.OK);
	}

}
