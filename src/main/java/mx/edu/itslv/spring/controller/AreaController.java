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

import mx.edu.itslv.spring.model.Area;
import mx.edu.itslv.spring.service.AreaService;

@Controller
public class AreaController {
	private AreaService areaService;

	@Autowired(required = true)
	@Qualifier(value = "areaService")
	public void setAreaService(AreaService areaService) {
		this.areaService = areaService;
	}

	@RequestMapping(value = "/areas", method = RequestMethod.GET)
	public ModelAndView index(Model model, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		if (session.getAttribute("nombre") != null && session.getAttribute("cve_usuario") != null) {
			model.addAttribute("listArea", this.areaService.listArea());
			modelAndView.setViewName("areas/index");
		} else {
			modelAndView.setViewName("redirect:/");
		}

		return modelAndView;
	}

	@RequestMapping(value = "/areas/new", method = RequestMethod.GET)
	public String create(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		model.addAttribute("area", new Area());
		model.addAttribute("date", date);
		return "areas/create";
	}

	@RequestMapping(value = "/areas/create", method = RequestMethod.POST)
	public String store(@ModelAttribute("area") Area a) {

		if (a.getId() == 0) {
			// new person, add it
			this.areaService.addArea(a);
		} else {
			// existing person, call update
			this.areaService.updateArea(a);
		}

		return "redirect:/areas";

	}

	@RequestMapping("/areas/{id}/edit")
	public String edit(@PathVariable("id") int id, Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		model.addAttribute("date", date);
		model.addAttribute("area", this.areaService.getAreaById(id));
		return "areas/edit";
	}

	@RequestMapping("/areas/{id}/destroy")
	public String destroy(@PathVariable("id") int id) {
		this.areaService.removeArea(id);
		return "redirect:/areas";
	}

}
