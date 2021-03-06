/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView form_login(Model model, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		if (session.getAttribute("nombre") != null && session.getAttribute("cve_usuario") != null) {
			modelAndView.setViewName("redirect:/home");
		} else {
			modelAndView.setViewName("login");
		}

		return modelAndView;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("usuario") Usuario u, HttpSession session) {
		Usuario usr = this.usuarioService.getUsuarioByLoginPassword(u.getLogin(), u.getPassword());
		ModelAndView modelAndView = new ModelAndView();
		if (usr != null) {
			session.setAttribute("cve_usuario", usr.getId());
			session.setAttribute("nombre", usr.getNombre_completo());
			modelAndView.setViewName("redirect:/home");
		} else {
			modelAndView.setViewName("redirect:/");
		}
		return modelAndView;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(Model model, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/");
		session.invalidate();
		return modelAndView;
	}

	@RequestMapping(value = "/usuarios", method = RequestMethod.GET)
	public ModelAndView  index(Model model, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		if (session.getAttribute("nombre") != null && session.getAttribute("cve_usuario") != null) {
			model.addAttribute("listUsuario", this.usuarioService.listUsuario());
			modelAndView.setViewName("usuarios/index");
		} else {
			modelAndView.setViewName("redirect:/");
		}

		return modelAndView;
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
