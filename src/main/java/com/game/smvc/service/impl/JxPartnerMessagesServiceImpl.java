package com.game.smvc.service.impl;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.modules.orm.GenericDao;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;
import com.game.smvc.entity.JxPartnerMessages;
import com.game.smvc.service.IJxPartnerMessagesService;

@Service("jxPartnerMessagesService")
public class JxPartnerMessagesServiceImpl extends
GenericManagerImpl<JxPartnerMessages, Long> implements IJxPartnerMessagesService{

	 private GenericDao<JxPartnerMessages, Long>jxPartnerMessagesDao;
	    private JdbcTemplate jdbcTemplate;
	    @Autowired
	    public JxPartnerMessagesServiceImpl(SessionFactory sessionFactory,DataSource dataSource) {
	        this.jxPartnerMessagesDao = new GenericDaoHibernate<JxPartnerMessages, Long>(JxPartnerMessages.class,
	                sessionFactory);
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	        this.dao = this.jxPartnerMessagesDao;
	    }
}
