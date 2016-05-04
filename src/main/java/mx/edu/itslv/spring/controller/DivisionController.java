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

import mx.edu.itslv.spring.model.Division;
import mx.edu.itslv.spring.service.DivisionService;

@Controller
public class DivisionController {

	private DivisionService divisionService;

	@Autowired(required = true)
	@Qualifier(value = "divisionService")
	public void setDivisionService(DivisionService divisionService) {
		this.divisionService = divisionService;
	}

	@RequestMapping(value = "/divisiones", method = RequestMethod.GET)
	public ModelAndView index(Model model, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		if (session.getAttribute("nombre") != null && session.getAttribute("cve_usuario") != null) {
			model.addAttribute("listDivision", this.divisionService.listDivision());
			modelAndView.setViewName("divisiones/index");
		} else {
			modelAndView.setViewName("redirect:/");
		}

		return modelAndView;
	}

	@RequestMapping(value = "/divisiones/new", method = RequestMethod.GET)
	public String create(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		model.addAttribute("date", date);
		model.addAttribute("division", new Division());
		return "divisiones/create";
	}

	@RequestMapping(value = "/divisiones/create", method = RequestMethod.POST)
	public String store(@ModelAttribute("division") Division d) {

		if (d.getId() == 0) {
			// new person, add it
			this.divisionService.addDivision(d);
		} else {
			// existing person, call update
			this.divisionService.updateDivision(d);
		}

		return "redirect:/divisiones";

	}

	@RequestMapping("/divisiones/{id}/edit")
	public String edit(@PathVariable("id") int id, Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		model.addAttribute("date", date);
		model.addAttribute("division", this.divisionService.getDivisionById(id));
		return "divisiones/edit";
	}

	@RequestMapping("/divisiones/{id}/destroy")
	public String destroy(@PathVariable("id") int id) {
		this.divisionService.removeDivision(id);
		return "redirect:/divisiones";
	}

}
