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

import mx.edu.itslv.spring.model.Carrera;
import mx.edu.itslv.spring.service.CarreraService;
import mx.edu.itslv.spring.service.DivisionService;

@Controller
public class CarreraController {

	private CarreraService carreraService;
	private DivisionService divisionService;

	@Autowired(required = true)
	@Qualifier(value = "carreraService")
	public void setCarreraService(CarreraService carreraService) {
		this.carreraService = carreraService;
	}

	@Autowired(required = true)
	@Qualifier(value = "divisionService")
	public void setDivisionService(DivisionService divisionService) {
		this.divisionService = divisionService;
	}

	@RequestMapping(value = "/carreras", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("listCarrera", this.carreraService.listCarrera());
		return "carreras/index";
	}

	@RequestMapping(value = "/carreras/new", method = RequestMethod.GET)
	public String create(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		model.addAttribute("date", date);
		model.addAttribute("carrera", new Carrera());
		model.addAttribute("listDivision", this.divisionService.listDivision());
		return "carreras/create";
	}

	@RequestMapping(value = "/carreras/create", method = RequestMethod.POST)
	public String store(@ModelAttribute("carrera") Carrera c) {

		if (c.getId() == 0) {
			// new person, add it
			this.carreraService.addCarrera(c);
		} else {
			// existing person, call update
			this.carreraService.updateCarrera(c);
		}

		return "redirect:/carreras";

	}

	@RequestMapping("/carreras/{id}/edit")
	public String edit(@PathVariable("id") int id, Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		model.addAttribute("date", date);
		model.addAttribute("carrera", this.carreraService.getCarreraById(id));
		model.addAttribute("listDivision", this.divisionService.listDivision());
		return "carreras/edit";
	}

	@RequestMapping("/carreras/{id}/destroy")
	public String destroy(@PathVariable("id") int id) {
		this.carreraService.removeCarrera(id);
		return "redirect:/carreras";
	}

}
