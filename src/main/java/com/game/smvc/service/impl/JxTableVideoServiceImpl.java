package com.game.smvc.service.impl;

import java.util.HashMap;
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
import com.game.smvc.entity.JxTableVideo;
import com.game.smvc.service.IJxTableVideoService;

@Service("jxTableVideoService")
public class JxTableVideoServiceImpl extends GenericManagerImpl<JxTableVideo,Long>implements IJxTableVideoService{

	private GenericDao<JxTableVideo, Long> jxTableVideoDao;
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JxTableVideoServiceImpl(SessionFactory sessionFactory,DataSource dataSource) {
		this.jxTableVideoDao = new GenericDaoHibernate<JxTableVideo,Long>(JxTableVideo.class,
				sessionFactory);
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.dao = this.jxTableVideoDao;
	}

	@Override
	public List<Map<String, Object>> findVideoOfType(String sup_id) {
		String sql = "select id,video_url,adv_url,is_accord,video_dir,sup_id,adv_imgurl logo from jx_advpic where adv_invildtime >= NOW() and sup_id = '"+sup_id+"'";
		return jdbcTemplate.queryForList(sql);
	}
}
