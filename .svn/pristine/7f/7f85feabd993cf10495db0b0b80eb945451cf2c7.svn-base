package com.game.smvc.service.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.modules.orm.GenericDao;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;
import com.game.smvc.entity.JxAppraise;
import com.game.smvc.service.IJxAppraiseService;

@Service("jxAppraiseService")
public class JxAppraiseServiceImpl extends GenericManagerImpl<JxAppraise, Long>
		implements IJxAppraiseService {

	private GenericDao<JxAppraise, Long> appraiseDao;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JxAppraiseServiceImpl(SessionFactory sessionFactory,
			DataSource dataSource) {
		this.appraiseDao = new GenericDaoHibernate<JxAppraise, Long>(
				JxAppraise.class, sessionFactory);
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.dao = this.appraiseDao;
	}

	@Override
	public List<Map<String, Object>> findAppraisesParticularsToId(
			String after_id) {
		String sql = "select u_id,pro_no,ord_no,service_type,service_master,service_master_phone,evaluation_people,evaluation_people_phone,ae_content,appraise_url,is_badge,is_overalls,is_anonymous,ae_satisfaction,service_attitude,DATE_FORMAT(ae_addtime,'%Y-%m-%d %H:%i:%s') ae_addtime from jx_appraise where after_id = '"
				+ after_id + "'";
		return jdbcTemplate.queryForList(sql);
	}
}
