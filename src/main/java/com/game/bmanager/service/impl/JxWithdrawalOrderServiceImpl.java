package com.game.bmanager.service.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.bmanager.entity.JxWithdrawalOrder;
import com.game.bmanager.service.IJxWithdrawalOrderService;
import com.game.modules.orm.GenericDao;
import com.game.modules.orm.Page;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;

@Service("jxWithdrawalOrderService")
public class JxWithdrawalOrderServiceImpl extends GenericManagerImpl <JxWithdrawalOrder,Long> implements IJxWithdrawalOrderService{

	private GenericDao<JxWithdrawalOrder, Long> jxWithdrawalOrderDao;
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JxWithdrawalOrderServiceImpl(SessionFactory sessionFactory,DataSource dataSource) {
		this.jxWithdrawalOrderDao = new GenericDaoHibernate<JxWithdrawalOrder,Long>(JxWithdrawalOrder.class,
				sessionFactory);
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.dao = this.jxWithdrawalOrderDao;
	}

	@Override
	public List<Map<String, Object>> findAllWithdrawalOrder(String username,int page) {
		String sql = "select * from jx_withdrawal_order where user_number = '"+username+"' limit "+page+",10";
		return jdbcTemplate.queryForList(sql);
	}

	@Override
	public Page<JxWithdrawalOrder> dimQueryAll(Page<JxWithdrawalOrder> page) {
		String sql = "SELECT * from jx_withdrawal_order where withdrawal_way = 0 ORDER BY  withdrawal_state asc,add_time desc";
		page = jxWithdrawalOrderDao.findPageOnSql(page, sql);
		return page;
		
	}

	@Override
	public Page<JxWithdrawalOrder> dimQueryOfUserid(
			Page<JxWithdrawalOrder> page, String userid) {
		String sql = "SELECT * from jx_withdrawal_order where user_number = '"+userid+"' ORDER BY  add_time asc";
		page = jxWithdrawalOrderDao.findPageOnSql(page, sql);
		return page;
	}

	@Override
	public Page<JxWithdrawalOrder> findRebateXQ(Page<JxWithdrawalOrder> page,
			String withdrawal_order) {
		String sql = "SELECT * FROM jx_partner_rebate where withdrawal_order = '"+withdrawal_order+"'";
		page = jxWithdrawalOrderDao.findPageOnSql(page, sql);
		return page;
	}

	@Override
	public Page<JxWithdrawalOrder> dimQueryOfRebates(
			Page<JxWithdrawalOrder> page, String withdrawal_order) {
		//String sql = "SELECT DISTINCT A.w_id,A.add_time,A.arrive_time,A.audit_time,A.last_modtime,A.withdrawal_amount,A.withdrawal_way,A.withdrawal_state,A.withdrawal_reason,A.pay_name,A.pay_account,A.user_number,A.withdrawal_order,A.real_name,B.total_amount,B.service_fee,B.f_renewal,B.build_store,B.f_installation,B.lower_rebate FROM jx_withdrawal_order A,jx_partner_rebate B where A.user_number = B.user_name and A.withdrawal_order = B.withdrawal_order and B.withdrawal_order = '"+withdrawal_order+"'";
		String sql = "SELECT * from jx_withdrawal_order where withdrawal_order = '"+withdrawal_order+"'";
		page = jxWithdrawalOrderDao.findPageOnSql(page, sql);
		return page;
	}
}
