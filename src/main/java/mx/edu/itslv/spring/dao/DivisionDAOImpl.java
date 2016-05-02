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

import mx.edu.itslv.spring.model.Division;

@Repository
public class DivisionDAOImpl implements DivisionDAO {
	private Logger logger = LoggerFactory.getLogger(DivisionDAOImpl.class);
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addDivision(Division d) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(d);
		logger.info("Division guardada, Division Detalle" + d);

	}

	@Override
	public void updateDivision(Division d) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(d);
		logger.info("Division Updated, Division Detalle" + d);

	}

	@Override
	public List<Division> listDivision() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Division> listDivision = session.createQuery("from Division order by id desc").list();
		logger.info("listDivision size: " + listDivision.size());
		return listDivision;
	}

	@Override
	public List<Division> listDivisionByActivo(boolean activo) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "from Division where activo = :activo order by id desc";
		Query q = session.createQuery(sql);
		q.setBoolean("activo", activo);
		List<Division> listDivision = q.list();
		logger.info("listDivision size: " + listDivision.size());
		return listDivision;
	}

	@Override
	public Division getDivisionById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Division d = (Division) session.load(Division.class, new Integer(id));
		logger.info("Division cargado, Division Detalle " + d);
		return d;
	}

	@Override
	public void removeDivision(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Division d = (Division) session.load(Division.class, new Integer(id));
		if (d != null) {
			session.delete(d);
		}
		logger.info("Division eliminada, Division Detalle " + d);

	}

}
