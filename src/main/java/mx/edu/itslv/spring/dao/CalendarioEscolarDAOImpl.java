package mx.edu.itslv.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import mx.edu.itslv.spring.model.CalendarioEscolar;
import mx.edu.itslv.spring.model.CalendarioEscolar;
import mx.edu.itslv.spring.model.CalendarioEscolar;
import mx.edu.itslv.spring.model.CalendarioEscolar;

@Repository
public class CalendarioEscolarDAOImpl implements CalendarioEscolarDAO {
	private Logger logger = LoggerFactory.getLogger(CalendarioEscolarDAOImpl.class);
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addCalendarioEscolar(CalendarioEscolar ce) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(ce);
		logger.info("CalendarioEscolar guardada, CalendarioEscolar Detalle" + ce);

	}

	@Override
	public void updateCalendarioEscolar(CalendarioEscolar ce) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(ce);
		logger.info("CalendarioEscolar Updated, CalendarioEscolar Detalle" + ce);

	}

	@Override
	public List<CalendarioEscolar> listCalendarioEscolar() {
		Session session = this.sessionFactory.getCurrentSession();
		List<CalendarioEscolar> listCalendarioEscolar = session.createQuery("from CalendarioEscolar order by id desc").list();
		logger.info("listCalendarioEscolar size: " + listCalendarioEscolar.size());
		return listCalendarioEscolar;
	}

	@Override
	public List<CalendarioEscolar> listCalendarioEscolarByActivo(boolean activo) {
		Session session = this.sessionFactory.getCurrentSession();
		String query = "from CalendarioEscolar where activo = :activo order by id desc";
		Query q = session.createQuery(query);
		q.setBoolean("activo", activo);
		List<CalendarioEscolar> listCalendarioEscolar = q.list();
		logger.info("listCalendarioEscolar size: " + listCalendarioEscolar.size());
		return listCalendarioEscolar;
	}

	@Override
	public CalendarioEscolar getCalendarioEscolarById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		CalendarioEscolar cc = (CalendarioEscolar) session.load(CalendarioEscolar.class,new Integer(id));
		logger.info("CalendarioEscolar cargado, CalendarioEscolar Detalle " + cc);
		return cc;
	}

	@Override
	public void removeCalendarioEscolar(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		CalendarioEscolar a = (CalendarioEscolar) session.load(CalendarioEscolar.class, new Integer(id));
		if (a != null) {
			session.delete(a);
		}
		logger.info("CalendarioEscolar eliminada, CalendarioEscolar Detalle " + a);

	}

}
