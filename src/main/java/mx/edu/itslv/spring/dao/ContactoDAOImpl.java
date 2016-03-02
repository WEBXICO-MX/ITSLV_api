/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import mx.edu.itslv.spring.model.Contacto;

@Repository
public class ContactoDAOImpl implements ContactoDAO {
	private Logger logger = LoggerFactory.getLogger(ContactoDAOImpl.class);
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addContacto(Contacto c) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(c);
		logger.info("Contacto guardada, Contacto Detalle" + c);

	}

	@Override
	public void updateContacto(Contacto c) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(c);
		logger.info("Contacto Updated, Contacto Detalle" +c);

	}

	@Override
	public List<Contacto> listContacto() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Contacto> listContacto = session.createQuery("from Contacto").list();
		logger.info("listContacto size: " + listContacto.size());
		return listContacto;
	}

	@Override
	public Contacto getContactoById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Contacto c = (Contacto) session.load(Contacto.class, new Integer(id));
		logger.info("Contacto cargado, Contacto Detalle " + c);
		return c;
	}

	@Override
	public void removeContacto(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Contacto c = (Contacto) session.load(Contacto.class, new Integer(id));
		if (c != null) {
			session.delete(c);
		}
		logger.info("Contacto eliminada, Contacto Detalle " + c);

	}

}
