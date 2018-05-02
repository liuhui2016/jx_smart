package com.game.smvc.service.impl;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.modules.orm.GenericDao;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;
import com.game.smvc.entity.JxBatch;
import com.game.smvc.service.IJxBatchService;

@Service("jxBatchService")
public class JxBatchServiceImpl extends GenericManagerImpl<JxBatch, Long>
		implements IJxBatchService {
	private GenericDao<JxBatch, Long> jxBacthDao;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JxBatchServiceImpl(SessionFactory sessionFactory,
			DataSource dataSource) {
		this.jxBacthDao = new GenericDaoHibernate<JxBatch, Long>(JxBatch.class,
				sessionFactory);
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.dao = this.jxBacthDao;
	}

	@Override
	public int ModifyTheOrderBasedOnId(String temp) {
		String sql = "delete from jx_batch where ord_id in("+temp+")";
		return jdbcTemplate.update(sql);
	}

	@Override
	public int ModifyTheOrderBasedTradeState(String s) {
		String sql = "update jx_order set trade_state = 200 where ord_id in("+s+")";
		return jdbcTemplate.update(sql);
	}

}
