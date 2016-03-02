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

import mx.edu.itslv.spring.model.Division;
import mx.edu.itslv.spring.service.DivisionService;

@RestController
public class DivisionRestController {
	private DivisionService divisionService;

	@Autowired(required = true)
	@Qualifier(value = "divisionService")
	public void setDivisionService(DivisionService divisionService) {
		this.divisionService = divisionService;
	}

	@RequestMapping(value = "/rest/divisiones", method = RequestMethod.GET)
	public ResponseEntity<List<Division>> listAllDivision() {
		List<Division> listDivision = divisionService.listDivision();
		if (listDivision.isEmpty()) {
			return new ResponseEntity<List<Division>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Division>>(listDivision, HttpStatus.OK);
	}

}
