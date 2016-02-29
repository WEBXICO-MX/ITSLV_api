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

import mx.edu.itslv.spring.model.ActividadUniversitaria;

@Repository
public class ActividadUniversitariaDAOImpl implements ActividadUniversitariaDAO {
	private Logger logger = LoggerFactory.getLogger(ActividadUniversitariaDAOImpl.class);
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addActividadUniversitaria(ActividadUniversitaria a) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(a);
		logger.info("ActividadUniversitaria guardada, ActividadUniversitaria Detalle" + a);

	}

	@Override
	public void updateActividadUniversitaria(ActividadUniversitaria a) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(a);
		logger.info("ActividadUniversitaria Updated, ActividadUniversitaria Detalle" + a);

	}

	@Override
	public List<ActividadUniversitaria> listActividadUniversitaria() {
		Session session = this.sessionFactory.getCurrentSession();
		List<ActividadUniversitaria> listActividadUniversitaria = session.createQuery("from ActividadUniversitaria").list();
		logger.info("listActividadUniversitaria size: " + listActividadUniversitaria.size());
		return listActividadUniversitaria;
	}

	@Override
	public ActividadUniversitaria getActividadUniversitariaById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		ActividadUniversitaria cc = (ActividadUniversitaria) session.load(ActividadUniversitaria.class,
				new Integer(id));
		logger.info("ActividadUniversitaria cargado, ActividadUniversitaria Detalle " + cc);
		return cc;
	}

	@Override
	public void removeActividadUniversitaria(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		ActividadUniversitaria a = (ActividadUniversitaria) session.load(ActividadUniversitaria.class, new Integer(id));
		if (a != null) {
			session.delete(a);
		}
		logger.info("ActividadUniversitaria eliminada, ActividadUniversitaria Detalle " + a);

	}

}
