package mx.edu.itslv.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import mx.edu.itslv.spring.model.CalendarioEscolarIconografia;

@Repository
public class CalendarioEscolarIconografiaDAOImpl implements CalendarioEscolarIconografiaDAO {
	private Logger logger = LoggerFactory.getLogger(CalendarioEscolarIconografiaDAOImpl.class);
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addCalendarioEscolarIconografia(CalendarioEscolarIconografia cei) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(cei);
		logger.info("CalendarioEscolarIconografia guardada, CalendarioEscolarIconografia Detalle" + cei);

	}

	@Override
	public void updateCalendarioEscolarIconografia(CalendarioEscolarIconografia cei) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(cei);
		logger.info("CalendarioEscolarIconografia Updated, CalendarioEscolarIconografia Detalle" + cei);

	}

	@Override
	public List<CalendarioEscolarIconografia> listCalendarioEscolarIconografia() {
		Session session = this.sessionFactory.getCurrentSession();
		List<CalendarioEscolarIconografia> listCalendarioEscolarIconografia = session.createQuery("from CalendarioEscolarIconografia order by id asc").list();
		logger.info("listCalendarioEscolarIconografia size: " + listCalendarioEscolarIconografia.size());
		return listCalendarioEscolarIconografia;
	}

	@Override
	public List<CalendarioEscolarIconografia> listCalendarioEscolarIconografiaByActivo(boolean activo) {
		Session session = this.sessionFactory.getCurrentSession();
		String query = "from CalendarioEscolarIconografia where activo = :activo order by id asc";
		Query q = session.createQuery(query);
		q.setBoolean("activo", activo);
		List<CalendarioEscolarIconografia> listCalendarioEscolarIconografia = q.list();
		logger.info("listCalendarioEscolarIconografia size: " + listCalendarioEscolarIconografia.size());
		return listCalendarioEscolarIconografia;
	}

	@Override
	public CalendarioEscolarIconografia getCalendarioEscolarIconografiaById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		CalendarioEscolarIconografia cc = (CalendarioEscolarIconografia) session.load(CalendarioEscolarIconografia.class,new Integer(id));
		logger.info("CalendarioEscolarIconografia cargado, CalendarioEscolarIconografia Detalle " + cc);
		return cc;
	}

	@Override
	public void removeCalendarioEscolarIconografia(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		CalendarioEscolarIconografia a = (CalendarioEscolarIconografia) session.load(CalendarioEscolarIconografia.class, new Integer(id));
		if (a != null) {
			session.delete(a);
		}
		logger.info("CalendarioEscolarIconografia eliminada, CalendarioEscolarIconografia Detalle " + a);

	}

}
