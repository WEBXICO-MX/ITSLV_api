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

import mx.edu.itslv.spring.model.Directorio;
import mx.edu.itslv.spring.service.DirectorioService;
import mx.edu.itslv.spring.service.AreaService;

@Controller
public class DirectorioController {

	private DirectorioService directorioService;
	private AreaService areaService;

	@Autowired(required = true)
	@Qualifier(value = "directorioService")
	public void setDirectorioService(DirectorioService directorioService) {
		this.directorioService = directorioService;
	}

	@Autowired(required = true)
	@Qualifier(value = "areaService")
	public void setAreaService(AreaService areaService) {
		this.areaService = areaService;
	}

	@RequestMapping(value = "/directorios", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("listDirectorio", this.directorioService.listDirectorio());
		return "directorios/index";
	}

	@RequestMapping(value = "/directorios/new", method = RequestMethod.GET)
	public String create(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date()); 
		model.addAttribute("directorio", new Directorio());
		model.addAttribute("listArea", this.areaService.listArea());
		return "directorios/create";
	}

	@RequestMapping(value = "/directorios/create", method = RequestMethod.POST)
	public String store(@ModelAttribute("directorio") Directorio d) {

		if (d.getId() == 0) {
			// new person, add it
			this.directorioService.addDirectorio(d);
		} else {
			// existing person, call update
			this.directorioService.updateDirectorio(d);
		}

		return "redirect:/directorios";

	}

	@RequestMapping("/directorios/{id}/edit")
	public String edit(@PathVariable("id") int id, Model model) {
		model.addAttribute("directorio", this.directorioService.getDirectorioById(id));
		model.addAttribute("listArea", this.areaService.listArea());
		return "directorios/edit";
	}

	@RequestMapping("/directorios/{id}/destroy")
	public String destroy(@PathVariable("id") int id) {
		this.directorioService.removeDirectorio(id);
		return "redirect:/directorios";
	}

}
