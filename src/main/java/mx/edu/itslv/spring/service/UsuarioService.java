/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import mx.edu.itslv.spring.model.Usuario;

public interface UsuarioService {
	public void addUsuario(Usuario u);

	public void updateUsuario(Usuario u);

	public List<Usuario> listUsuario();

	public Usuario getUsuarioById(int id);
	
	public Usuario getUsuarioByLoginPassword(String login, String password);

	public void removeUsuario(int id);

}
