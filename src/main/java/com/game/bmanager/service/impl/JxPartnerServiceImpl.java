package com.game.bmanager.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.bmanager.entity.JxPartner;
import com.game.bmanager.service.IJxPartnerService;
import com.game.modules.orm.GenericDao;
import com.game.modules.orm.Page;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;
import com.game.smvc.entity.JxOrder;

@Service("partnerService")
public class JxPartnerServiceImpl extends GenericManagerImpl<JxPartner, Long>
		implements IJxPartnerService {
	private GenericDao<JxPartner, Long> partnerDao;
	 private GenericDao<JxOrder, Long> orderDao;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JxPartnerServiceImpl(SessionFactory sessionFactory,
			DataSource dataSource) {
		this.partnerDao = new GenericDaoHibernate<JxPartner, Long>(
				JxPartner.class, sessionFactory);
		this.dao = this.partnerDao;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public Page<JxPartner> querySubordinate(Page<JxPartner> page, Long parentid) {
		page = partnerDao.findPageOnSql(page,
				"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,total_number,card_number from jx_partner where par_parentid= '"+parentid+"' ");
		
	/*	page = partnerDao.findPageOnSql(page,
				"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions from jx_partner where par_parentid in (1,2,3,4)");
		*/
		return page;
	}
	
	//新增查询方法
	public Page<JxOrder> selectNo(Page<JxOrder> page, Long id){
		page = orderDao.findPageOnSql(page, "select ord_no,adr_id,pro_id,ord_way,ord_protypeid,ord_price,ord_managerno,ord_color,ord_phone,ord_addtime from jx_order where ord_managerno = ?", id);
		return page;
		
	}
	

	@Override
	public Page<JxPartner> querySelectResourcer(Page<JxPartner> pageResourcer,
			String par_level) {
		if(par_level.equals("2")){
			pageResourcer = partnerDao.findPageOnSql(pageResourcer,
					"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,total_number,card_number from jx_partner where par_level in (1,2)");
		}else if(par_level.equals("3")){
			pageResourcer = partnerDao.findPageOnSql(pageResourcer,
					"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,total_number,card_number from jx_partner where par_level in (1,2,3)");
		
		}else{
			pageResourcer = partnerDao.findPageOnSql(pageResourcer,
					"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,total_number,card_number from jx_partner where par_level=?", par_level);
		
		}
		
		return pageResourcer;
	}

	@Override
	public Page<JxPartner> dimQuery(Page<JxPartner> pageResourcer,
			String par_level, String par_name,Long parId) {
		if(par_name != null && parId == null){
		pageResourcer = partnerDao.findPageOnSql(pageResourcer,
				"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,total_number,card_number from jx_partner where par_level=" + par_level
						+ " and PAR_NAME like '%" + par_name + "%'");
		}else if("".equals(par_name) && parId !=null){
			pageResourcer = partnerDao.findPageOnSql(pageResourcer,
					"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,total_number,card_number from jx_partner where par_level=" + par_level
							+ " and id =" + parId);
		}else{
			pageResourcer = partnerDao.findPageOnSql(pageResourcer,
					"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,total_number,card_number from jx_partner where par_level=" + par_level
							+ " and PAR_NAME like '%" + par_name + "%' and id ="+parId);
		}
		return pageResourcer;
	}

	@Override
	public Page<JxPartner> queryProvince(Page<JxPartner> page, String userid) {
		if (userid.equals("admin")) {
			//page = partnerDao.findPageOnSql(page,"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions from jx_partner where par_parentid is null or par_parentid='' ");
			page = partnerDao.findPageOnSql(page,"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,three_years_numbers,card_number from jx_partner where par_level in (1,2,3,4,-1,-2,-3) ORDER BY  id asc ");
		} else if(userid.equals("ruize")){
			page = partnerDao.findPageOnSql(page,"select P.id, P.par_name,P.par_level,P.par_parentid,P.par_parent,P.par_area,P.par_address,P.par_phone,P.par_other,P.par_sellernum,P.par_shop,P.par_pact,P.ispermissions,P.total_number,P.three_years_numbers,card_number from jx_partner P,acc_user A where P.par_name = A.real_name and P.par_level in (-1)");
		}else{
			page = partnerDao.findPageOnSql(page,"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,three_years_numbers,card_number from jx_partner where id =" + userid);
			
		}
		return page;
	}

	@Override
	public Page<JxPartner> dimQueryProvince(Page<JxPartner> page,
			String parName, Long id,String userid,String lever) {
		String sql = "select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,three_years_numbers,card_number from jx_partner where ";
		if(userid.equals("admin")){
			if (parName != null && id == null) {
				sql = sql + "PAR_NAME like '%" + parName + "%'";
			} else if (id != null && parName == null) {
				sql = sql + "and id =" + id;
			} else {
				sql = sql + "PAR_NAME like '%" + parName + "%' and id =" + id;
			}
		}else{
			if(lever.equals("1")){
				sql = "select * from (select * from jx_partner c  where c.par_parentid = "+userid+" or c.par_parentid in (select id from jx_partner d  where d.par_parentid = "+userid+") UNION ALL select * from jx_partner as e where e.par_parentid in  (select id from jx_partner as a  where a.par_parentid in (select id from jx_partner  as b where b.par_parentid = "+userid+"))) as a where ";
				sql = publicMethod(parName, id, sql);
			}else if(lever.equals("2")){
				sql ="select * from (select * from jx_partner where par_parentid = "+userid+" or par_parentid in (select id from jx_partner where par_parentid = "+userid+")) as a where ";
				sql = publicMethod(parName, id, sql);
			}else if(lever.equals("3")){
				sql ="select * from (select * from jx_partner where par_parentid = "+userid+")as a where ";
				sql = publicMethod(parName, id, sql);
			}else{
				sql = "select * from jx_partner where id =" + userid;
			}
		}
		page = partnerDao.findPageOnSql(page, sql);
		return page;
	}

	private String publicMethod(String parName, Long id, String sql) {
		if (parName != null && id == null) {
			sql = sql + "a.PAR_NAME like '%" + parName + "%'";
		} else if (id != null && parName == null) {
			sql = sql + "and a.id =" + id;
		} else {
			sql = sql + "a.PAR_NAME like '%" + parName + "%' and a.id =" + id;
		}
		return sql;
	}

	@Override
	public String findCityCodeByCity(String par_level, String s_province,
			String s_city, String s_county) {
		if (par_level.equals("1")) {
			s_city = null;
			s_county = null;
		} else if (par_level.equals("2")) {
			s_county = null;
		}
		String sql = "select city_code from cityadmincode where province = '"
				+ s_province + "' and city = '" + s_city + "' and county = '"
				+ s_county + "'";
		return jdbcTemplate.queryForObject(sql, String.class);
	}

	@Override
	public Integer countNum() {
		String sql = "select count(*)+1 from jx_partner";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	@Override
	public String queryLever(String userid) {
		String sql ="select par_level from jx_partner where id ="+userid;
		return jdbcTemplate.queryForObject(sql, String.class);
	}

	//根据产品经理编号查询订单
/*	@Override
	public String querySubordinateNo(Long id) {
		String sql = "select O.ord_no,O.adr_id,O.pro_id,O.ord_way,O.ord_protypeid,O.ord_price,O.ord_managerno,O.ord_color,O.ord_phone,O.ord_addtime from jx_order O,jx_partner P where O.ord_managerno = P.id";
		return jdbcTemplate.queryForObject(sql, String.class);
	}*/
	//根据产品经理编号查询订单
	@Override
	public List<Map<String, List<Map<String, Object>>>> querySubordinateNo(Long parentid) {
		List<Map<String, List<Map<String, Object>>>> list = new ArrayList<Map<String, List<Map<String, Object>>>>();
		
		/*String sql = "select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum from jx_partner where par_parentid=?"+parentid;
		List<Map<String, Object>> parent = this.jdbcTemplate
				.queryForList(sql);*/
		Map<String, List<Map<String, Object>>> map = new HashMap<String, List<Map<String, Object>>>();
		String sql1 = "select O.ord_no,O.adr_id,O.pro_id,O.ord_way,O.ord_protypeid,O.ord_price,O.ord_managerno,O.ord_color,O.ord_phone,O.ord_addtime from jx_order O,jx_partner P where O.ord_managerno = P.parentid";
		
		List<Map<String, Object>> order = this.jdbcTemplate
				.queryForList(sql1);
		//map.put("parent", parent);
		map.put("order", order);
		list.add(map);
		return list;
	}

	@Override
	public List<Map<String, Object>> findselectNo(Long id) {
		String sql = "select O.ord_no,O.adr_id,O.pro_id,O.ord_way,O.ord_protypeid,O.ord_price,O.ord_managerno,O.ord_color,O.ord_phone,O.ord_addtime from jx_order O,jx_partner P where P.id = "+id;
		return jdbcTemplate.queryForList(sql);
	}

	@Override
	public Page<JxPartner> querySubordinates(Page<JxPartner> page, String parentid) {
		System.out.println(parentid);
		page = partnerDao.findPageOnSql(page,
		"select A.username, P.par_name,P.par_level,P.par_parentid,P.par_parent,P.par_area,P.par_address,P.par_phone,P.par_other,P.par_sellernum,P.total_number,P.three_years_numbers,P.card_number from jx_partner P,acc_user A where P.par_name = A.real_name and P.par_other = '"+parentid+"' ");
		return page;
	}

	@Override
	public String findParentid(Long id) {
		String sql = "select par_other from jx_partner where id = '"+id+"'";
		return jdbcTemplate.queryForObject(sql, String.class);
	}


	@Override
	public Page<JxPartner> querySubordinatess(Page<JxPartner> page,
			String parentid, Long id) {
		String sql = "select par_other from jx_partner where id = '"+id+"'";
		String s = jdbcTemplate.queryForObject(sql, String.class);
		System.out.println("dddd:"+s);
		page = partnerDao.findPageOnSql(page,
				"select DISTINCT  P.par_other, P.par_name,P.par_level,P.par_parentid,P.par_parent,P.par_area,P.par_address,P.par_phone,P.par_other,P.par_sellernum,P.id,P.par_shop,P.par_pact,P.ispermissions,P.total_number,P.three_years_numbers,P.card_number from jx_partner P,acc_user A where P.par_name = A.real_name and P.par_parentid = '"+s+"' ");
				//"select P.par_other, P.par_name,P.par_level,P.par_parentid,P.par_parent,P.par_area,P.par_address,P.par_phone,P.par_other,P.par_sellernum,P.id from jx_partner P where P.par_level = '"+s+"'");
		return page;
	}

	@Override
	public Page<JxPartner> querySelectResourcerRT(
			Page<JxPartner> pageResourcer, String par_levels) {
		if(par_levels.equals("-2")){
			pageResourcer = partnerDao.findPageOnSql(pageResourcer,
					"select A.username, P.par_name,P.par_level,P.par_parentid,P.par_parent,P.par_area,P.par_address,P.par_phone,P.par_other,P.par_sellernum,P.id,P.par_shop,P.par_pact,P.ispermissions,P.total_number,P.three_years_numbers,P.card_number from jx_partner P,acc_user A where P.par_name = A.real_name and P.par_other = A.username and P.par_level in(-1,-2)");
		}else{
			pageResourcer = partnerDao.findPageOnSql(pageResourcer,
					//"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum from jx_partner where par_level=?", par_levels);
					"select A.username, P.par_name,P.par_level,P.par_parentid,P.par_parent,P.par_area,P.par_address,P.par_phone,P.par_other,P.par_sellernum,P.id,P.par_shop,P.par_pact,P.ispermissions,P.total_number,P.three_years_numbers,P.card_number from jx_partner P,acc_user A where P.par_name = A.real_name and P.par_other = A.username and P.par_level = '"+par_levels+"' ");
		}

		return pageResourcer;
	}

	@Override
	public Page<JxPartner> dimQueryRT(Page<JxPartner> pageResourcer,
			String par_levels, String par_names, Long parId) {
		if(par_names != null && parId == null){
			pageResourcer = partnerDao.findPageOnSql(pageResourcer,
					"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,three_years_numbers,card_number from jx_partner where par_level=" + par_levels
							+ " and PAR_NAME like '%" + par_names + "%'");
			}else if("".equals(par_names) && parId !=null){
				pageResourcer = partnerDao.findPageOnSql(pageResourcer,
						"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,three_years_numbers,card_number from jx_partner where par_level=" + par_levels
								+ " and id =" + parId);
			}else{
				pageResourcer = partnerDao.findPageOnSql(pageResourcer,
						"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,three_years_numbers,card_number from jx_partner where par_level=" + par_levels
								+ " and PAR_NAME like '%" + par_names + "%' and id ="+parId);
			}
			return pageResourcer;
	}

	@Override
	public String findParOther(Long id) {
		String sql = "select par_other from jx_partner where id = "+id;
		return jdbcTemplate.queryForObject(sql, String.class);
	}

	@Override
	public String findId(String par_other) {
		String sql = "select id from acc_user where username = '"+par_other+"'";
		return jdbcTemplate.queryForObject(sql, String.class);
	}

	@Override
	public int deleteAccUser(String ids1) {
		String sql = "delete from acc_user where id = '"+ids1+"'";
		return jdbcTemplate.update(sql);
	}

	@Override
	public int deleteUserRole(String ids1) {
		String sql = "delete from acc_user_role_use where user_id = '"+ids1+"'";
		return jdbcTemplate.update(sql);
	}

	@Override
	public Page<JxPartner> queryProvinceByYYS(Page<JxPartner> page,
			String userid) {
		String sql1 = "select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,three_years_numbers,card_number from jx_partner where par_level in (1,2) ORDER BY  id asc";
		List<Map<String, Object>> order = this.jdbcTemplate.queryForList(sql1);
		
		page = partnerDao.findPageOnSql(page,"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,three_years_numbers,card_number from jx_partner where par_level in (1,2) ORDER BY  id asc ");
		return page;
	}

	@Override
	public List<Map<String, Object>> selectAll() {
		String sql = "select * from jx_partner where par_level in (1,2) ORDER BY  id asc";
		return jdbcTemplate.queryForList(sql);
	}

	@Override
	public Page<JxPartner> queryProvinces(Page<JxPartner> page, String userid) {
	
		page = partnerDao.findPageOnSql(page,"select id, par_name,par_level,par_parentid,par_parent,par_area,par_address,par_phone,par_other,par_sellernum,par_shop,par_pact,ispermissions,total_number,three_years_numbers,card_number from jx_partner where total_number >= 50 and three_years_numbers >=20 and par_level in (1,2) ORDER BY  id asc ");
		return page;
	}

	@Override
	public int updatePartner(String ord_managerno) {
		String sql = "update jx_partner set par_level= 1,par_parentid = null,par_parent = null where id='"+ord_managerno+"'";
		return jdbcTemplate.update(sql);
	}
	
	
}