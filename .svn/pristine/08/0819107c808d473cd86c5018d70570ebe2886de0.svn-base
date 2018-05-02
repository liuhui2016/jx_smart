package com.game.bmanager.service.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.bmanager.entity.JxPartnerRebate;
import com.game.bmanager.entity.JxWithdrawalOrder;
import com.game.bmanager.service.IJxPartnerRebateService;
import com.game.modules.orm.GenericDao;
import com.game.modules.orm.Page;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;

@Service("jxPartnerRebateService")
public class JxPartnerRebateServiceImpl extends
GenericManagerImpl<JxPartnerRebate, Long> implements IJxPartnerRebateService{

	private GenericDao<JxPartnerRebate, Long> jxPartnerRebateDao;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JxPartnerRebateServiceImpl(SessionFactory sessionFactory,
			DataSource dataSource) {
		this.jxPartnerRebateDao = new GenericDaoHibernate<JxPartnerRebate, Long>(
				JxPartnerRebate.class, sessionFactory);
		this.dao = this.jxPartnerRebateDao;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Map<String,Object>> findLastAddtime(String username) {
		String sql = "SELECT * from jx_partner_rebate where user_name = '"+username+"' and w_state = 3 and withdrawal_state = 200 ORDER BY add_time DESC LIMIT 1";
		return jdbcTemplate.queryForList(sql);
	}

	@Override
	public JxPartnerRebate findRebateXQ(String withdrawal_order) {
		String sql = "FROM jx_partner_rebate where withdrawal_order = '"+withdrawal_order+"'";
		System.out.println(sql);
		return jxPartnerRebateDao.findOne(sql);
	}

	@Override
	public Page<JxPartnerRebate> findRebates(Page<JxPartnerRebate> pages,
			String withdrawal_order) {
		String sql = "SELECT * FROM jx_partner_rebate where withdrawal_order = '"+withdrawal_order+"'";
		pages = jxPartnerRebateDao.findPageOnSql(pages, sql);
		return pages;
	}

	@Override
	public Page<JxPartnerRebate> dimQueryOfRebates(Page<JxPartnerRebate> page,
			String withdrawal_order) {
		String sql = "SELECT * FROM jx_partner_rebate where withdrawal_order = '"+withdrawal_order+"'";
		page = jxPartnerRebateDao.findPageOnSql(page, sql);
		return page;
	}

	@Override
	public String findNameToWithdrawalOrder(String withdrawal_order) {
		String sql = "select real_name from jx_withdrawal_order where withdrawal_order = '"+withdrawal_order+"'";
		return jdbcTemplate.queryForObject(sql, String.class);
	}

	@Override
	public List<Map<String, Object>> findLastAddtimes(String user_name) {
		String sql = "SELECT * from jx_partner_rebate where user_name = '"+user_name+"' and w_state = 3 and withdrawal_state = 3 ORDER BY add_time DESC LIMIT 1";
		return jdbcTemplate.queryForList(sql);
	}


	
	/*@Override
	public Page<JxPartnerRebate> findRebateXQ(Page<JxPartnerRebate> page,
			String withdrawal_order) {
		String sql = "SELECT * FROM jx_partner_rebate where withdrawal_order = '"+withdrawal_order+"'";
		page = jxPartnerRebateDao.findPageOnSql(page, sql);
		return page;
	}*/

	

	
}
