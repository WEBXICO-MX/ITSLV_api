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

import mx.edu.itslv.spring.model.Materia;
import mx.edu.itslv.spring.service.MateriaService;

@RestController
public class MateriaRestController {
	private MateriaService materiaService;

	@Autowired(required = true)
	@Qualifier(value = "materiaService")
	public void setMateriaService(MateriaService materiaService) {
		this.materiaService = materiaService;
	}

	@RequestMapping(value = "/rest/materias", method = RequestMethod.GET)
	public ResponseEntity<List<Materia>> listAllMateria() {
		List<Materia> listMateria = materiaService.listMateria();
		if (listMateria.isEmpty()) {
			return new ResponseEntity<List<Materia>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Materia>>(listMateria, HttpStatus.OK);
	}

}
