/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mx.edu.itslv.spring.model.Usuario;
import mx.edu.itslv.spring.service.UsuarioService;

@Controller
public class UsuarioController {
	private UsuarioService usuarioService;

	@Autowired(required = true)
	@Qualifier(value = "usuarioService")
	public void setUsuarioService(UsuarioService usuarioService) {
		this.usuarioService = usuarioService;
	}

	@RequestMapping(value = "/usuarios", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("listUsuario", this.usuarioService.listUsuario());
		return "usuarios/index";
	}

	@RequestMapping(value = "/usuarios/new", method = RequestMethod.GET)
	public String create(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date()); 
		model.addAttribute("date", date);
		model.addAttribute("usuario", new Usuario());
		return "usuarios/create";
	}

	@RequestMapping(value = "/usuarios/create", method = RequestMethod.POST)
	public String store(@ModelAttribute("usuario") Usuario u) {

		if (u.getId() == 0) {
			// new person, add it
			this.usuarioService.addUsuario(u);
		} else {
			// existing person, call update
			this.usuarioService.updateUsuario(u);
		}

		return "redirect:/usuarios";

	}

	@RequestMapping("/usuarios/{id}/edit")
	public String edit(@PathVariable("id") int id, Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date()); 
		model.addAttribute("date", date);
		model.addAttribute("usuario", this.usuarioService.getUsuarioById(id));
		return "usuarios/edit";
	}

	@RequestMapping("/usuarios/{id}/destroy")
	public String destroy(@PathVariable("id") int id) {
		this.usuarioService.removeUsuario(id);
		return "redirect:/usuarios";
	}

}
