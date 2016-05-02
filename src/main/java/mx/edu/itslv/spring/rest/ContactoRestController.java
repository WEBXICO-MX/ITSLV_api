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

import mx.edu.itslv.spring.model.Contacto;
import mx.edu.itslv.spring.service.ContactoService;

@RestController
public class ContactoRestController {
	private ContactoService contactoService;

	@Autowired(required = true)
	@Qualifier(value = "contactoService")
	public void setContactoService(ContactoService contactoService) {
		this.contactoService = contactoService;
	}

	@RequestMapping(value = "/rest/contactos", method = RequestMethod.GET)
	public ResponseEntity<List<Contacto>> listAllContacto() {
		List<Contacto> listContacto = contactoService.listContactoByActivo(true);
		if (listContacto.isEmpty()) {
			return new ResponseEntity<List<Contacto>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Contacto>>(listContacto, HttpStatus.OK);
	}
}
