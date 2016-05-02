/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import mx.edu.itslv.spring.model.Servicio;

@Repository
public class ServicioDAOImpl implements ServicioDAO {
	private Logger logger = LoggerFactory.getLogger(ServicioDAOImpl.class);
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addServicio(Servicio s) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(s);
		logger.info("Servicio guardada, Servicio Detalle" + s);

	}

	@Override
	public void updateServicio(Servicio s) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(s);
		logger.info("Servicio Updated, Servicio Detalle" + s);

	}

	@Override
	public List<Servicio> listServicio() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Servicio> listServicio = session.createQuery("from Servicio").list();
		logger.info("listServicio size: " + listServicio.size());
		return listServicio;
	}

	@Override
	public List<Servicio> listServicioByActivo(boolean activo) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "from Servicio where activo = :activo";
		Query q = session.createQuery(sql);
		q.setBoolean("activo", activo);
		List<Servicio> listServicio = q.list();
		logger.info("listServicio size: " + listServicio.size());
		return listServicio;
	}

	@Override
	public Servicio getServicioById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Servicio s = (Servicio) session.load(Servicio.class, new Integer(id));
		logger.info("Servicio cargado, Servicio Detalle " + s);
		return s;
	}

	@Override
	public void removeServicio(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Servicio s = (Servicio) session.load(Servicio.class, new Integer(id));
		if (s != null) {
			session.delete(s);
		}
		logger.info("Servicio eliminada, Servicio Detalle " + s);

	}

}
