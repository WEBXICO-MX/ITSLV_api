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

import mx.edu.itslv.spring.model.Materia;
import mx.edu.itslv.spring.service.MateriaService;
import mx.edu.itslv.spring.service.CarreraService;

@Controller
public class MateriaController {

	private MateriaService materiaService;
	private CarreraService carreraService;

	@Autowired(required = true)
	@Qualifier(value = "materiaService")
	public void setMateriaService(MateriaService materiaService) {
		this.materiaService = materiaService;
	}

	@Autowired(required = true)
	@Qualifier(value = "carreraService")
	public void setCarreraService(CarreraService carreraService) {
		this.carreraService = carreraService;
	}

	@RequestMapping(value = "/materias", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("listMateria", this.materiaService.listMateria());
		return "materias/index";
	}

	@RequestMapping(value = "/materias/new", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("materia", new Materia());
		model.addAttribute("listCarrera", this.carreraService.listCarrera());
		return "materias/create";
	}

	@RequestMapping(value = "/materias/create", method = RequestMethod.POST)
	public String store(@ModelAttribute("materia") Materia m) {

		if (m.getId() == 0) {
			// new person, add it
			this.materiaService.addMateria(m);
		} else {
			// existing person, call update
			this.materiaService.updateMateria(m);
		}

		return "redirect:/materias";

	}

	@RequestMapping("/materias/{id}/edit")
	public String edit(@PathVariable("id") int id, Model model) {
		model.addAttribute("materia", this.materiaService.getMateriaById(id));
		model.addAttribute("listCarrera", this.carreraService.listCarrera());
		return "materias/edit";
	}

	@RequestMapping("/materias/{id}/destroy")
	public String destroy(@PathVariable("id") int id) {
		this.materiaService.removeMateria(id);
		return "redirect:/materias";
	}

}
