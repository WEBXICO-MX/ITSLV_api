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

import mx.edu.itslv.spring.model.Carrera;
@Repository
public class CarreraDAOImpl implements CarreraDAO {
	private Logger logger = LoggerFactory.getLogger(CarreraDAOImpl.class);
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addCarrera(Carrera c) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(c);
		logger.info("Carrera guardada, Carrera Detalle" + c);

	}

	@Override
	public void updateCarrera(Carrera c) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(c);
		logger.info("Carrera Updated, Carrera Detalle" + c);

	}

	@Override
	public List<Carrera> listCarrera() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Carrera> listCarrera = session.createQuery("from Carrera").list();
		logger.info("listCarrera size: " + listCarrera.size());
		return listCarrera;
	}

	@Override
	public Carrera getCarreraById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Carrera c = (Carrera) session.load(Carrera.class, new Integer(id));
		logger.info("Carrera cargado, Carrera Detalle " + c);
		return c;
	}

	@Override
	public void removeCarrera(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Carrera c = (Carrera) session.load(Carrera.class, new Integer(id));
		if (c != null) {
			session.delete(c);
		}
		logger.info("Carrera eliminada, Carrera Detalle " + c);

	}

}
