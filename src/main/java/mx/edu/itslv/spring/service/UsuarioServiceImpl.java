/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mx.edu.itslv.spring.dao.UsuarioDAO;
import mx.edu.itslv.spring.model.Usuario;

@Service
public class UsuarioServiceImpl implements UsuarioService {
	private UsuarioDAO usuarioDAO;

	public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
		this.usuarioDAO = usuarioDAO;
	}

	@Override
	@Transactional
	public void addUsuario(Usuario u) {
		this.usuarioDAO.addUsuario(u);

	}

	@Override
	@Transactional
	public void updateUsuario(Usuario u) {
		this.usuarioDAO.updateUsuario(u);

	}

	@Override
	@Transactional
	public List<Usuario> listUsuario() {
		// TODO Auto-generated method stub
		return this.usuarioDAO.listUsuario();
	}

	@Override
	@Transactional
	public Usuario getUsuarioById(int id) {
		// TODO Auto-generated method stub
		return this.usuarioDAO.getUsuarioById(id);
	}

	@Override
	@Transactional
	public Usuario getUsuarioByLoginPassword(String login, String password) {
		// TODO Auto-generated method stub
		return this.usuarioDAO.getUsuarioByLoginPassword(login, password);
	}

	@Override
	@Transactional
	public void removeUsuario(int id) {
		this.usuarioDAO.removeUsuario(id);

	}

}
