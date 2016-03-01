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

import mx.edu.itslv.spring.model.Usuario;
import mx.edu.itslv.spring.service.UsuarioService;

@RestController
public class UsuarioRestController {
	private UsuarioService usuarioService;

	@Autowired(required = true)
	@Qualifier(value = "usuarioService")
	public void setUsuarioService(UsuarioService usuarioService) {
		this.usuarioService = usuarioService;
	}

	@RequestMapping(value = "/rest/usuarios", method = RequestMethod.GET)
	public ResponseEntity<List<Usuario>> listAllUsuario() {
		List<Usuario> listUsuario = usuarioService.listUsuario();
		if (listUsuario.isEmpty()) {
			return new ResponseEntity<List<Usuario>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Usuario>>(listUsuario, HttpStatus.OK);
	}

}
