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

import mx.edu.itslv.spring.model.Area;
import mx.edu.itslv.spring.service.AreaService;

@RestController
public class AreaRestController {
	private AreaService areaService;

	@Autowired(required = true)
	@Qualifier(value = "areaService")
	public void setAreaService(AreaService areaService) {
		this.areaService = areaService;
	}

	@RequestMapping(value = "/rest/areas", method = RequestMethod.GET)
	public ResponseEntity<List<Area>> listAllArea() {
		List<Area> listArea = areaService.listArea();
		if (listArea.isEmpty()) {
			return new ResponseEntity<List<Area>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Area>>(listArea, HttpStatus.OK);
	}

}
