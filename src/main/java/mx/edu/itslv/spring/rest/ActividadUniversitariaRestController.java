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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import mx.edu.itslv.spring.model.ActividadUniversitaria;
import mx.edu.itslv.spring.service.ActividadUniversitariaService;

@RestController
public class ActividadUniversitariaRestController {
	private ActividadUniversitariaService actividadUniversitariaService;

	@Autowired(required = true)
	@Qualifier(value = "actividadUniversitariaService")
	public void setActividadUniversitariaService(ActividadUniversitariaService actividadUniversitariaService) {
		this.actividadUniversitariaService = actividadUniversitariaService;
	}

	@RequestMapping(value = "/rest/actividadesuniversitarias", method = RequestMethod.GET)
	public ResponseEntity<List<ActividadUniversitaria>> listAllActividadUniversitaria() {
		List<ActividadUniversitaria> listActividadUniversitaria = actividadUniversitariaService
				.listActividadUniversitaria();
		if (listActividadUniversitaria.isEmpty()) {
			return new ResponseEntity<List<ActividadUniversitaria>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ActividadUniversitaria>>(listActividadUniversitaria, HttpStatus.OK);
	}

	@RequestMapping(value = "/rest/actividadesuniversitarias/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ActividadUniversitaria actividadUniversitariaById(@PathVariable("id") int id) {
		ActividadUniversitaria a = actividadUniversitariaService.getActividadUniversitariaById(id);
		return a;
	}

}
