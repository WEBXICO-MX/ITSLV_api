/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mx.edu.itslv.spring.dao.ContactoDAO;
import mx.edu.itslv.spring.model.Contacto;

@Service
public class ContactoServiceImpl implements ContactoService {
	private ContactoDAO contactoDAO;

	public void setContactoDAO(ContactoDAO contactoDAO) {
		this.contactoDAO = contactoDAO;
	}

	@Override
	@Transactional
	public void addContacto(Contacto c) {
		this.contactoDAO.addContacto(c);

	}

	@Override
	@Transactional
	public void updateContacto(Contacto c) {
		this.contactoDAO.updateContacto(c);

	}

	@Override
	@Transactional
	public List<Contacto> listContacto() {
		// TODO Auto-generated method stub
		return this.contactoDAO.listContacto();
	}

	@Override
	@Transactional
	public List<Contacto> listContactoByActivo(boolean activo) {
		// TODO Auto-generated method stub
		return this.contactoDAO.listContactoByActivo(activo);
	}

	@Override
	@Transactional
	public Contacto getContactoById(int id) {
		// TODO Auto-generated method stub
		return this.contactoDAO.getContactoById(id);
	}

	@Override
	@Transactional
	public void removeContacto(int id) {
		this.contactoDAO.removeContacto(id);

	}

}
