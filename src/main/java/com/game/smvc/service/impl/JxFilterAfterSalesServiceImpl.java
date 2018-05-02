package com.game.smvc.service.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.bmanager.entity.JxFilterWarning;
import com.game.modules.orm.GenericDao;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;
import com.game.smvc.entity.JxFilterAfterSales;
import com.game.smvc.entity.JxOrder;
import com.game.smvc.service.IJxFilterAfterSalesService;

@Service("jxFilterAfterSalesService")
public class JxFilterAfterSalesServiceImpl extends
		GenericManagerImpl<JxFilterAfterSales, Long> implements
		IJxFilterAfterSalesService {

	private GenericDao<JxFilterAfterSales, Long> jxFilterAfterSalesDao;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JxFilterAfterSalesServiceImpl(SessionFactory sessionFactory,
			DataSource dataSource) {
		this.jxFilterAfterSalesDao = new GenericDaoHibernate<JxFilterAfterSales, Long>(
				JxFilterAfterSales.class, sessionFactory);
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.dao = this.jxFilterAfterSalesDao;
	}

	// 根据用户Id查看所有设备信息
	@Override
	public List<Map<String, Object>> findFilterOfUserId(String userid, int page) {
		String sql="select p.pro_no,pro_color color,A.pro_id,A.ord_managerno,A.ord_no,pro_name name,A.ord_imgurl url,p.pro_alias pro_alias,A.ord_receivename receivename "
				+"from jx_product p,jx_order A "
				+"where A.pro_no=p.pro_no and p.u_id='"+userid+"' and A.ord_status=3 order by p.pro_id desc limit "+page+",10";
		return jdbcTemplate.queryForList(sql);
	}

	// 查看所有售后信息根据状态
	@Override
	public List<Map<String, Object>> findAfterInformationOfState(
			String fas_state, String u_id, int page) {
		String sql = "select id,fas_state,fas_type,specific_reason,DATE_FORMAT(fas_addtime,'%Y-%m-%d %H:%i:%s') fas_addtime,DATE_FORMAT(fas_modtime,'%Y-%m-%d %H:%i:%s') fas_modtime from jx_filter_after_sales where u_id = '"
				+ u_id
				+ "' and fas_state = '"
				+ fas_state
				+ "' order by fas_addtime desc LIMIT " + page + ",10";
		return jdbcTemplate.queryForList(sql);
	}

	// 根据Id查看售后详情
	@Override
	public List<Map<String, Object>> findAfterthedetailsToId(String id) {
		String sql = "select id,pro_id,u_id,ord_color,pro_no,ord_no,pro_name,proflt_life,filter_name,DATE_FORMAT(make_time,'%Y-%m-%d %H:%i:%s') make_time,contact_person,contact_way,user_address,address_details,fault_cause,specific_reason,fautl_url,ord_managerno,fas_state,fas_type,DATE_FORMAT(fas_addtime,'%Y-%m-%d %H:%i:%s') fas_addtime,DATE_FORMAT(fas_modtime,'%Y-%m-%d %H:%i:%s') fas_modtime from jx_filter_after_sales where id = '"
				+ id + "'";
		return jdbcTemplate.queryForList(sql);
	}

	// 查询所有上架的设备故障
	@Override
	public List<Map<String, Object>> findFault(String is_shelves) {
		String sql = "select * from jx_fault where is_shelves = '" + is_shelves
				+ "'";
		return jdbcTemplate.queryForList(sql);
	}

	// 查询所有滤芯
	@Override
	public List<Map<String, Object>> findFilter(String pro_no) {
		String sql = "select prf_pp pp,prf_cto cto,prf_ro ro,prf_t33 t33,prf_wfr wfr from jx_proflt where pro_no = '"
				+ pro_no + "'";
		return jdbcTemplate.queryForList(sql);
	}

	
}
