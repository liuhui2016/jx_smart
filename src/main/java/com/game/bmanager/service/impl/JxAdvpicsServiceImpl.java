package com.game.bmanager.service.impl;

import java.util.List;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.bmanager.entity.JxAdvpics;
import com.game.bmanager.service.IJxAdvpicsService;
import com.game.modules.orm.GenericDao;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;

@Service("advpicsService")
public class JxAdvpicsServiceImpl extends GenericManagerImpl<JxAdvpics,Long>implements IJxAdvpicsService{
	private GenericDao<JxAdvpics, Long> advpicsDao;
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public JxAdvpicsServiceImpl(SessionFactory sessionFactory,DataSource dataSource) {
        this.advpicsDao = new GenericDaoHibernate<JxAdvpics,Long>(JxAdvpics.class,sessionFactory);
        this.dao = this.advpicsDao;
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
	@Override
	public Page<JxAdvpics> searchPages(Page<JxAdvpics> page,
			List<PropertyFilter> filters, String sup_id) {
		String sql = "select A.id,A.adv_phone,A.adv_imgurl,A.adv_dir,A.adv_name,A.adv_type,A.adv_vaildtime,A.adv_invildtime,A.adv_addtime,A.adv_modtime,A.adv_url,A.adv_other,A.video_url,A.video_dir,A.sup_id,A.is_accord,A.video_type from jx_advpic A where sup_id = '"+sup_id+"'";
		//String sql = "select * from jx_advpic where sup_id = '"+sup_id+"'";
		page = advpicsDao.findPageOnSql(page,sql);
		return page;
	}
    

}
