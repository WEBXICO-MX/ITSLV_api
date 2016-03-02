/**
 *
 * @author Roberto Eder Weiss Juárez
 * @see {@link http://webxico.blogspot.mx/}
 */
package mx.edu.itslv.spring.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import mx.edu.itslv.spring.dao.DivisionDAO;
import mx.edu.itslv.spring.model.Division;

@Service
public class DivisionServiceImpl implements DivisionService {
	private DivisionDAO divisionDAO;

	public void setDivisionDAO(DivisionDAO divisionDAO) {
		this.divisionDAO = divisionDAO;
	}

	@Override
	@Transactional
	public void addDivision(Division d) {
		this.divisionDAO.addDivision(d);

	}

	@Override
	@Transactional
	public void updateDivision(Division d) {
		this.divisionDAO.updateDivision(d);

	}

	@Override
	@Transactional
	public List<Division> listDivision() {
		// TODO Auto-generated method stub
		return this.divisionDAO.listDivision();
	}

	@Override
	@Transactional
	public Division getDivisionById(int id) {
		// TODO Auto-generated method stub
		return this.divisionDAO.getDivisionById(id);
	}

	@Override
	@Transactional
	public void removeDivision(int id) {
		this.divisionDAO.removeDivision(id);

	}

}
