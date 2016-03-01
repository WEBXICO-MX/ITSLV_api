/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mx.edu.itslv.spring.model.Servicio;
import mx.edu.itslv.spring.service.ServicioService;

@Controller
public class ServicioController {
	private ServicioService servicioService;

	@Autowired(required = true)
	@Qualifier(value = "servicioService")
	public void setServicioService(ServicioService servicioService) {
		this.servicioService = servicioService;
	}

	@RequestMapping(value = "/servicios", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("listServicio", this.servicioService.listServicio());
		return "servicios/index";
	}

	@RequestMapping(value = "/servicios/new", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("servicio", new Servicio());
		return "servicios/create";
	}

	@RequestMapping(value = "/servicios/create", method = RequestMethod.POST)
	public String store(@ModelAttribute("servicio") Servicio s) {

		if (s.getId() == 0) {
			// new person, add it
			this.servicioService.addServicio(s);
		} else {
			// existing person, call update
			this.servicioService.updateServicio(s);
		}

		return "redirect:/servicios";

	}

	@RequestMapping("/servicios/{id}/edit")
	public String edit(@PathVariable("id") int id, Model model) {
		model.addAttribute("servicio", this.servicioService.getServicioById(id));
		return "servicios/edit";
	}

	@RequestMapping("/servicios/{id}/destroy")
	public String destroy(@PathVariable("id") int id) {
		this.servicioService.removeServicio(id);
		return "redirect:/servicios";
	}

}
