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

import mx.edu.itslv.spring.model.Materia;

@Repository
public class MateriaDAOImpl implements MateriaDAO {
	private Logger logger = LoggerFactory.getLogger(MateriaDAOImpl.class);
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addMateria(Materia m) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(m);
		logger.info("Materia guardada, Materia Detalle" + m);

	}

	@Override
	public void updateMateria(Materia m) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(m);
		logger.info("Materia Updated, Materia Detalle" + m);

	}

	@Override
	public List<Materia> listMateria() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Materia> listMateria = session.createQuery("from Materia order by id desc").list();
		logger.info("listMateria size: " + listMateria.size());
		return listMateria;
	}

	@Override
	public Materia getMateriaById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Materia m = (Materia) session.load(Materia.class, new Integer(id));
		logger.info("Materia cargado, Materia Detalle " + m);
		return m;
	}

	@Override
	public void removeMateria(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Materia m = (Materia) session.load(Materia.class, new Integer(id));
		if (m != null) {
			session.delete(m);
		}
		logger.info("Materia eliminada, Materia Detalle " + m);

	}

}
