package com.game.comm.service.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.comm.entity.AreaCode;
import com.game.comm.service.IAreaCodeService;
import com.game.modules.orm.GenericDao;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;
@Service("areaCodeService")
public class AreaCodeServiceImpl extends GenericManagerImpl<AreaCode, Long> implements IAreaCodeService{
	
	private GenericDao<AreaCode, Long> areaCodeDao;
	private JdbcTemplate jdbcTemplate;
	@Autowired
	public AreaCodeServiceImpl(SessionFactory sessionFactory,DataSource dataSource) {
		this.areaCodeDao = new GenericDaoHibernate<AreaCode,Long>(AreaCode.class,sessionFactory);
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.dao = this.areaCodeDao;
		
	    }
	@Override
	public String findAreaCode(String s_city) {
		String sql = "select code from area_code where city = '"+s_city+"'";
		return jdbcTemplate.queryForObject(sql,String.class);
	}
	
	@Override
	public List<Map<String, Object>> findACode(String par_level, String s_city,String parParentid) {
		String sql = null;
		if(par_level.equals("-1")){
			sql = "select * from jx_partner where  par_level = '"+par_level+"' and par_area like '%"+s_city+"%'";
		}else{
			sql = "select * from jx_partner where  par_level = '"+par_level+"' and par_parentid = '"+parParentid+"'";
		}
		return jdbcTemplate.queryForList(sql);
	}
	@Override
	public List<Map<String, Object>> findOtherCode(String par_level, String city,String parParentid) {
		String sql = null;
		if(par_level.equals("-1")){
			System.out.println("一级");
			sql = "select par_other from jx_partner where  par_level = '"+par_level+"' and par_area like '%"+city+"%' ORDER BY id DESC LIMIT 0,1";
		}else{
			System.out.println("二三级");
			sql = "select * from jx_partner where  par_level = '"+par_level+"' and par_parentid = '"+parParentid+"' ORDER BY id DESC LIMIT 0,1";
		}
		return jdbcTemplate.queryForList(sql);
	}
	
}
