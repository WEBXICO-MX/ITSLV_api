/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.dao;

import java.util.List;

import mx.edu.itslv.spring.model.Contacto;

public interface ContactoDAO {
	public void addContacto(Contacto c);

	public void updateContacto(Contacto c);

	public List<Contacto> listContacto();

	public List<Contacto> listContactoByActivo(boolean activo);

	public Contacto getContactoById(int id);

	public void removeContacto(int id);

}
