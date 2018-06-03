package com.game.smvc.service.impl;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.modules.orm.GenericDao;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;
import com.game.smvc.entity.JxSale;
import com.game.smvc.service.IJxSaleService;

@Service("jxSaleService")
public class JxSaleServiceImpl extends GenericManagerImpl<JxSale, Long> implements IJxSaleService{

	 private GenericDao<JxSale, Long> jxSaleDao;
	    private JdbcTemplate jdbcTemplate;
	    @Autowired
	    public JxSaleServiceImpl(SessionFactory sessionFactory,DataSource dataSource) {
	        this.jxSaleDao = new GenericDaoHibernate<JxSale,Long>(JxSale.class,
	                sessionFactory);
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	        this.dao = this.jxSaleDao;
	    }
}
