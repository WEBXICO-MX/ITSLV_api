/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import mx.edu.itslv.spring.model.Contacto;

public interface ContactoService {
	public void addContacto(Contacto c);

	public void updateContacto(Contacto c);

	public List<Contacto> listContacto();

	public Contacto getContactoById(int id);

	public void removeContacto(int id);

}
