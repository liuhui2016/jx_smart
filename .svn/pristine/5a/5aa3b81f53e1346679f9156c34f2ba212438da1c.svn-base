package com.game.bmanager.service.impl;

import java.util.List;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.bmanager.entity.JxVideo;
import com.game.bmanager.service.IJxVideoService;
import com.game.modules.orm.GenericDao;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;

@Service("videoService")
public class JxVideoServiceImpl extends GenericManagerImpl<JxVideo,Long>implements IJxVideoService{
	private GenericDao<JxVideo, Long> videoDao;
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public JxVideoServiceImpl(SessionFactory sessionFactory,DataSource dataSource) {
        this.videoDao = new GenericDaoHibernate<JxVideo,Long>(JxVideo.class,sessionFactory);
        this.dao = this.videoDao;
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

	
	@Override
	public Page<JxVideo> searchPages(Page<JxVideo> page,
			List<PropertyFilter> filters, String sup_id) {
		page = videoDao.findPageOnSql(page,"select * from jx_video where sup_id =" + sup_id);
		return page;
	}


}
