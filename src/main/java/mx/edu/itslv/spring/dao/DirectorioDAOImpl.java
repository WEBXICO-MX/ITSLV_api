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

import mx.edu.itslv.spring.model.Directorio;

@Repository
public class DirectorioDAOImpl implements DirectorioDAO {
	private Logger logger = LoggerFactory.getLogger(DirectorioDAOImpl.class);
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addDirectorio(Directorio d) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(d);
		logger.info("Directorio guardada, Directorio Detalle" + d);

	}

	@Override
	public void updateDirectorio(Directorio d) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(d);
		logger.info("Directorio Updated, Directorio Detalle" + d);

	}

	@Override
	public List<Directorio> listDirectorio() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Directorio> listDirectorio = session.createQuery("from Directorio").list();
		logger.info("listDirectorio size: " + listDirectorio.size());
		return listDirectorio;
	}

	@Override
	public List<Directorio> listDirectorioByActivo(boolean activo) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "from Directorio where activo = :activo";
		Query q = session.createQuery(sql);
		q.setBoolean("activo", activo);
		List<Directorio> listDirectorio = q.list();
		logger.info("listDirectorio size: " + listDirectorio.size());
		return listDirectorio;
	}

	@Override
	public Directorio getDirectorioById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Directorio d = (Directorio) session.load(Directorio.class, new Integer(id));
		logger.info("Directorio cargado, Directorio Detalle " + d);
		return d;
	}

	@Override
	public void removeDirectorio(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Directorio d = (Directorio) session.load(Directorio.class, new Integer(id));
		if (d != null) {
			session.delete(d);
		}
		logger.info("Directorio eliminada, Directorio Detalle " + d);

	}

	@Override
	public List<Directorio> listDirectorioByArea(int area_id) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "from Directorio where area_id = :area_id and activo = :activo";
		Query q = session.createQuery(sql);
		q.setInteger("area_id", area_id);
		q.setBoolean("activo", true);
		List<Directorio> listDirectorio = q.list();
		logger.info("listDirectorio size: " + listDirectorio.size());
		return listDirectorio;
	}

}
