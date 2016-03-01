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

import mx.edu.itslv.spring.model.Area;

@Repository
public class AreaDAOImpl implements AreaDAO {
	private Logger logger = LoggerFactory.getLogger(AreaDAOImpl.class);
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addArea(Area a) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(a);
		logger.info("Area guardada, Area Detalle" + a);

	}

	@Override
	public void updateArea(Area a) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(a);
		logger.info("Area Updated, Area Detalle" + a);

	}

	@Override
	public List<Area> listArea() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Area> listArea = session.createQuery("from Area").list();
		logger.info("listArea size: " + listArea.size());
		return listArea;
	}

	@Override
	public Area getAreaById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Area a = (Area) session.load(Area.class, new Integer(id));
		logger.info("Area cargado, Area Detalle " + a);
		return a;
	}

	@Override
	public void removeArea(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Area a = (Area) session.load(Area.class, new Integer(id));
		if (a != null) {
			session.delete(a);
		}
		logger.info("Area eliminada, Area Detalle " + a);

	}

}
