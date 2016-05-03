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

import mx.edu.itslv.spring.model.Contacto;
import mx.edu.itslv.spring.service.ContactoService;

@Controller
public class ContactoController {
	private ContactoService contactoService;

	@Autowired(required = true)
	@Qualifier(value = "contactoService")
	public void setContactoService(ContactoService contactoService) {
		this.contactoService = contactoService;
	}

	@RequestMapping(value = "/contactos", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("listContacto", this.contactoService.listContacto());
		return "contactos/index";
	}

	@RequestMapping(value = "/contactos/new", method = RequestMethod.GET)
	public String create(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		model.addAttribute("date", date);
		model.addAttribute("contacto", new Contacto());
		return "contactos/create";
	}

	@RequestMapping(value = "/contactos/create", method = RequestMethod.POST)
	public String store(@ModelAttribute("contacto") Contacto c) {

		if (c.getId() == 0) {
			// new person, add it
			this.contactoService.addContacto(c);
		} else {
			// existing person, call update
			this.contactoService.updateContacto(c);
		}

		return "redirect:/contactos";

	}

	@RequestMapping("/contactos/{id}/edit")
	public String edit(@PathVariable("id") int id, Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date()); 
		model.addAttribute("date", date);
		model.addAttribute("contacto", this.contactoService.getContactoById(id));
		return "contactos/edit";
	}

	@RequestMapping("/contactos/{id}/destroy")
	public String destroy(@PathVariable("id") int id) {
		this.contactoService.removeContacto(id);
		return "redirect:/contactos";
	}

}
