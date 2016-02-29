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

import mx.edu.itslv.spring.model.ActividadUniversitaria;
import mx.edu.itslv.spring.service.ActividadUniversitariaService;
@Controller
public class ActividadUniversitariaController {
	private ActividadUniversitariaService actividadUniversitariaService;

	@Autowired(required = true)
	@Qualifier(value = "actividadUniversitariaService")
	public void setActividadUniversitariaService(ActividadUniversitariaService actividadUniversitariaService) {
		this.actividadUniversitariaService = actividadUniversitariaService;
	}

	@RequestMapping(value = "/actividadesuniversitarias", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("listActividadUniversitaria",
				this.actividadUniversitariaService.listActividadUniversitaria());
		return "actividadesUniversitarias/index";
	}

	@RequestMapping(value = "/actividadesuniversitarias/new", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("actividadUniversitaria", new ActividadUniversitaria());
		return "actividadesUniversitarias/create";
	}

	@RequestMapping(value = "/actividadesuniversitarias/create", method = RequestMethod.POST)
	public String store(@ModelAttribute("actividadUniversitaria") ActividadUniversitaria a) {

		if (a.getId() == 0) {
			// new person, add it
			this.actividadUniversitariaService.addActividadUniversitaria(a);
		} else {
			// existing person, call update
			this.actividadUniversitariaService.updateActividadUniversitaria(a);
		}

		return "redirect:/actividadesuniversitarias";

	}

	@RequestMapping("/actividadesuniversitarias/{id}/edit")
	public String edit(@PathVariable("id") int id, Model model) {
		model.addAttribute("actividadUniversitaria",
				this.actividadUniversitariaService.getActividadUniversitariaById(id));
		return "actividadesUniversitarias/edit";
	}

	@RequestMapping("/actividadesuniversitarias/{id}/destroy")
	public String destroy(@PathVariable("id") int id) {
		this.actividadUniversitariaService.removeActividadUniversitaria(id);
		return "redirect:/actividadesuniversitarias";
	}

}
