package com.game.bmanager.service.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.bmanager.entity.JxDrawPeople;
import com.game.bmanager.service.IJxDrawPeopleService;
import com.game.modules.orm.GenericDao;
import com.game.modules.orm.Page;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;

@Service("jxDrawPeopleService")
public class JxDrawPeopleServiceImpl extends GenericManagerImpl<JxDrawPeople, Long>
implements IJxDrawPeopleService{
	
	private GenericDao<JxDrawPeople, Long> jxDrawPeopleDao;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JxDrawPeopleServiceImpl(SessionFactory sessionFactory,
			DataSource dataSource) {
		this.jxDrawPeopleDao = new GenericDaoHibernate<JxDrawPeople, Long>(
				JxDrawPeople.class, sessionFactory);
		this.dao = this.jxDrawPeopleDao;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Map<String, Object>> findDrts(String withdrawalOrderNo) {
		String sql = "select id,by_tkr_id number,by_tkr_name name,by_tkr_total_money money,by_tkr_rebates rebates from jx_draw_people where withdrawal_order = '"+withdrawalOrderNo+"'";
		return jdbcTemplate.queryForList(sql);
	}

	@Override
	public String findUsernameById(String id) {
		String sql = "select by_tkr_id from jx_draw_people where id = "+id+"";
		return jdbcTemplate.queryForObject(sql, String.class);
	}

	@Override
	public Page<JxDrawPeople> dimQueryOfRebates(Page<JxDrawPeople> page,
			String withdrawal_order) {
		page = jxDrawPeopleDao.findPageOnSql(page,"select * from jx_draw_people where withdrawal_order = '"+withdrawal_order+"'");
		return page;
	}

	@Override
	public List<Map<String, Object>> findAllOrders(String withdrawal_order) {
		String sql = "select * from jx_draw_people where withdrawal_order = '"+withdrawal_order+"'";
		return jdbcTemplate.queryForList(sql);
	}

	@Override
	public Float fondMostMoney(String withdrawal_order) {
		String sql = "select sum(by_tkr_total_money) from jx_draw_people where withdrawal_order = '"+withdrawal_order+"'";
		return jdbcTemplate.queryForObject(sql, Float.class);
	}

	@Override
	public Page<JxDrawPeople> dimQueryOfRebatesOfTkrId(Page<JxDrawPeople> page,
			String withdrawal_order, String by_tkr_id) {
		page = jxDrawPeopleDao.findPageOnSql(page,"select * from jx_draw_people where withdrawal_order = '"+withdrawal_order+"' and by_tkr_id = '"+by_tkr_id+"'");
		return page;
	}

	@Override
	public int findupdate_states(String withdrawal_order) {
		String sql = "update jx_draw_people set withdrawal_state = 1 where withdrawal_order = '"+withdrawal_order+"'";
		return jdbcTemplate.update(sql);
	}

	

}
