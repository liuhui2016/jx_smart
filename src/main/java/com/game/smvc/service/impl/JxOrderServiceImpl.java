package com.game.smvc.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.modules.orm.GenericDao;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;
import com.game.smvc.entity.JxOrder;
import com.game.smvc.service.IJxOrderService;

@Service("jxOrderService")
public class JxOrderServiceImpl extends GenericManagerImpl<JxOrder, Long>
		implements IJxOrderService {
	private GenericDao<JxOrder, Long> orderDao;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JxOrderServiceImpl(SessionFactory sessionFactory,
			DataSource dataSource) {
		this.orderDao = new GenericDaoHibernate<JxOrder, Long>(JxOrder.class,
				sessionFactory);
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.dao = this.orderDao;
	}

	/*
	 * 修改订单支付状态
	 */
	@Override
	public int modifyOrderStatus(String out_trade_no) {
		String sql = "update jx_order set ord_status=1 where ord_no=?";
		int update = this.jdbcTemplate.update(sql, out_trade_no);

		return update;
	}

	/*
	 * 根据订单号删除订单
	 */
	@Override
	public Boolean deleteProductByordNo(String id) {
		String sql = "update jx_order set ord_status=2 where ord_no=? and ord_status=0";
		int update = this.jdbcTemplate.update(sql, id);
		if (update <= 0)
			return false;
		return true;
	}

	// 通过id查看地址详情
	@Override
	public Map<String, Object> findAddressById(Long id) {
		Map<String, Object> map = jdbcTemplate
				.queryForMap(
						"select adr_name name,CONCAT(adr_area,adr_detail) address,adr_phone phone from jx_address where adr_id = ?",
						id);
		return map;
	}

	// 根据经理编号查看经理是否存在
	@Override
	public Boolean queryPaternerByManagerNo(String managerNo) {
		String sql = "select count(*) from jx_partner where id = ? ";
		int i = this.jdbcTemplate.queryForInt(sql, managerNo);
		if (i > 0)
			return true;
		return false;
	}

	// 查看商品名字
	@Override
	public String findProNameById(Long pro_id) {
		String sql = "select prot_name name from jx_prototal where id=?";
		return (String) jdbcTemplate.queryForObject(sql, String.class, pro_id);
	}

	/*
	 * 跟据产品号查询服务包年还是包流量
	 */
	@Override
	public String findpayWayByProNo(String pro_no) {

		String sql = "SELECT B.PAY_TYPENAME name FROM "
				+ "JX_ORDER A INNER JOIN JX_PAY B ON A.ORD_PROTYPEID=B.PAY_ID"
				+ " where A.pro_no=? and A.ord_status=3";
		return this.jdbcTemplate.queryForObject(sql, new Object[] { pro_no },
				String.class);
	}

	/*
	 * 根据产品编号查询服务详情
	 */
	@Override
	public List<Map<String, Object>> findServiceDetailByProNo(String pro_no) {

		String sql = "SELECT o.pro_id productId,o.ord_no,o.ord_receivename name,o.ord_phone phone,p.pro_no,CAST(o.ORD_PRICE AS CHAR(20)) ord_price,DATE_FORMAT(p.pro_addtime,'%Y-%m-%d') pro_addtime,DATE_FORMAT(p.pro_invalidtime,'%Y-%m-%d') pro_invalidtime,p.pro_hasflow,p.pro_restflow,o.pro_restflow restflow,o.ord_protypeid type,"
				+ "'1' as sharetype,p.pro_name,o.ord_color,o.ord_multiple from jx_order o,jx_product p where o.pro_no=p.pro_no and p.pro_no=? and o.ord_status=3";
		return jdbcTemplate.queryForList(sql, pro_no);
	}

	/*
	 * 查询所有消息列表
	 */
	@Override
	public List<Map<String, Object>> queryAllMess(String uid, String page) {
		// String
		// sql="select * from jx_messages where u_id=? order by id limit ?,10";
		// String
		// sql="select * from jx_messages where u_id=? order by isread ASC limit ?,10";
		String sql = "select * from jx_messages where u_id=? order by isread ASC,message_time DESC limit ?,10";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, uid,
				(Integer.parseInt(page) - 1) * 10);
		System.out.println(list);
		return list;
	}

	// 修改已读未读
	@Override
	public int updateMessageStatusById(String id) {
		String sql = "update jx_messages set isread = 1 where id = ?";

		return jdbcTemplate.update(sql, id);
	}

	/*
	 * 
	 * 查看续费订单详情
	 */
	@Override
	public List<Map<String, List<Map<String, Object>>>> findAgainOrderDetailByOno(
			String ono, String productId) {

		// TODO
		String sql = "SELECT A.ORD_NO ordNo,D.prod_name proname,A.ord_receivename name,A.adr_id address,A.ord_color color,A.ord_imgurl url,ord_protypeid paytype,A.ord_ordertype isagain,"
				+ "A.ord_phone phone,A.ord_sertime serttime,A.ord_way way,CAST(A.ORD_PRICE AS CHAR(20))  price,A.ORD_STATUS status FROM jx_order A,jx_user B,"
				+ "jx_prodetail D where A.u_id=B.u_id  and A.pro_id=D.prot_id and A.ord_no=? limit 0,1";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, ono);

		String sql2 = "select pay_typename paytype,CAST(pay_totalmoney AS CHAR(20)) price from jx_pay where pay_typeid=?";
		
	/*	String sql3 = "SELECT count(*) FROM jx_order where ord_no= '"+ono+"' and ord_status in(4,5)";
		int number = jdbcTemplate.queryForInt(sql3);
		Map<String, Object> m = list.get(0);
		if(number == 0){//第一次续费
			Float price = (Float) m.get("price");
			price = price - 200;
			m.put("price", price);
		}else if(number == 1){//第二次续费
			Float price = (Float) m.get("price");
			price = price - 300;
			m.put("price", price);
		}*/
		
		List<Map<String, Object>> listpay = this.jdbcTemplate.queryForList(
				sql2, productId);
		List<Map<String, List<Map<String, Object>>>> l = new ArrayList<Map<String, List<Map<String, Object>>>>();
		Map<String, List<Map<String, Object>>> map = new HashMap<String, List<Map<String, Object>>>();
		map.put("orderdetail", list);
		map.put("paytype", listpay);
		l.add(map);
		System.out.println(l);
		return l;

	}

	@Override
	public JxOrder queryOrderByProno(String pro_no) {
		String hql = "from JxOrder where pro_no='" + pro_no
				+ "' and ord_status=3";
		return orderDao.findOne(hql);
	}

	@SuppressWarnings("unused")
	@Override
	public List<Map<String, Object>> findServiceDetailByProNo(String pro_no,
			String user) {
		String uid = jdbcTemplate.queryForObject(
				"select u_id from jx_product where pro_no=?", String.class,
				pro_no);
		if (user.equals(uid)) {
			String sql = "SELECT o.pro_id productId,o.ord_no,o.ord_receivename name,o.ord_phone phone,p.pro_no,CAST(o.ORD_PRICE AS CHAR(20)) ord_price,DATE_FORMAT(p.pro_addtime,'%Y-%m-%d') pro_addtime,DATE_FORMAT(p.pro_invalidtime,'%Y-%m-%d') pro_invalidtime,p.pro_hasflow,p.pro_restflow,o.ord_protypeid type,"
					+ "'0' as sharetype,p.pro_name,o.ord_color from jx_order o,jx_product p where o.pro_no=p.pro_no and p.pro_no=? and o.ord_status=3";
		}

		String sql = "SELECT o.pro_id productId,o.ord_no,o.ord_receivename name,o.ord_phone phone,p.pro_no,CAST(o.ORD_PRICE AS CHAR(20)) ord_price,DATE_FORMAT(p.pro_addtime,'%Y-%m-%d') pro_addtime,DATE_FORMAT(p.pro_invalidtime,'%Y-%m-%d') pro_invalidtime,p.pro_hasflow,p.pro_restflow,o.ord_protypeid type,"
				+ "'1' as sharetype,p.pro_name,o.ord_color from jx_order o,jx_product p where o.pro_no=p.pro_no and p.pro_no=? and o.ord_status=3";
		return jdbcTemplate.queryForList(sql, pro_no);

	}

	// 解绑的方法
	@Override
	public List<Map<String, List<Map<String, Object>>>> unTabletBinding(int id) {
		// 查询是否有此订单
		String sql = "select ord_status from jx_order where ord_no=? ";
		// 剩余流量和已用流量
		// String sql =
		// "select pro_hasflow,pro_restflow from jx_product where pro_id = ?";
		List<Map<String, Object>> status = this.jdbcTemplate.queryForList(sql,
				id);
		// 用户名
		// String sql1 = "select u_name from jx_user where u_id = ?";
		// List<Map<String, Object>> names =
		// this.jdbcTemplate.queryForList(sql1, id);
		// 状态判断
		/*
		 * String sql2 ="update jx_order set ord_status = 6 where ord_no = ? ";
		 * List<Map<String, Object>> statu =
		 * this.jdbcTemplate.queryForList(sql1, id);
		 */
		// UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值
		List<Map<String, List<Map<String, Object>>>> list = new ArrayList<Map<String, List<Map<String, Object>>>>();
		Map<String, List<Map<String, Object>>> map = new HashMap<String, List<Map<String, Object>>>();
		map.put("orderno", status);
		// map.put("name", names);
		// map.put("statu", statu);
		list.add(map);
		return list;
	}

	// 修改状态的方法
	@Override
	public int updateStatusAndProNo(String pro_no) {
		String sql = "update jx_order set ord_status=1 where ord_no=?";
		return jdbcTemplate.update(sql, pro_no);
	}

	// 查看商品类型
	@Override
	public int selectType(String orderno) {
		String sql = "select pro_id from jx_order where ord_no = " + orderno;
		return jdbcTemplate.queryForInt(sql);

	}

	@Override
	public String findProNameByIds(int pro_id) {
		String sql = "select prot_name name from jx_prototal where id=?";
		return (String) jdbcTemplate.queryForObject(sql, String.class, pro_id);
	}

	@Override
	public JxOrder selectOrdernoByProno(String prono) {
		String sql = "select * from jx_order where pro_no='" + prono
				+ "' and ord_status=4 ORDER BY ord_id asc LIMIT 1";
		return orderDao.findOne(sql);
	}

	// 查看平板续费订单
	@Override
	public List<Map<String, Object>> selectOrdernoByPronos(String prono) {
		String sql = "select * from jx_order where pro_no='" + prono
				+ "' and ord_status=4 ORDER BY ord_id asc LIMIT 1";
		return jdbcTemplate.queryForList(sql);
	}

	// 查看合肥市的用户人数
	@Override
	public int selectCity(String city) {
		// String sql =
		// "select count(distinct u_id) from jx_order where adr_id like '%"+city+"%'";
		String sql = "select count(u_id) from jx_order where adr_id like '%"
				+ city + "%'";
		return jdbcTemplate.queryForInt(sql);
	}

	// 得到今日饮水量的数量
	@Override
	public int findwater(String uid) {
		String sql = "select sum(pro_restflow) from jx_order where u_id = '"
				+ uid + "' and ord_status=3";
		return jdbcTemplate.queryForInt(sql);
	}

	@Override
	public List<Map<String, Object>> findrestflow(String uid) {
		String sql = "select pro_restflow,ord_modtime from jx_order where u_id = '"
				+ uid + "' and ord_status=3";
		return jdbcTemplate.queryForList(sql);
	}

	@Override
	public int findnumber(String uid) {
		String sql = "select count(*) from jx_order where u_id = '" + uid
				+ "' and ord_status=3";
		return jdbcTemplate.queryForInt(sql);
	}

	@Override
	public List<Map<String, Object>> findtime(String uid) {
		String sql = "select ord_modtime from jx_order where u_id = '" + uid
				+ "' and ord_status=3 order by ord_modtime desc LIMIT 1";
		return jdbcTemplate.queryForList(sql);
	}

	// 总押金
	@Override
	public int findmuit(String s) {
		String sql = "select sum(ord_pledge) from jx_order where fim_ord_no = "
				+ s;
		return jdbcTemplate.queryForInt(sql);
	}

	@Override
	public int updatemultiple(String ono) {
		String sql = "update jx_order set ord_multiple = 1 where ord_no = "
				+ ono;
		return jdbcTemplate.update(sql);
	}

	@Override
	public JxOrder findall(String ono) {
		String sql = "from jx_order where ord_no = " + ono;
		return orderDao.findOne(sql);
	}

	@Override
	public JxOrder findorder(String ono) {
		String sql = "from jx_order where ord_no =  '" + ono
				+ "' or fim_ord_no = '" + ono
				+ "' order by ord_id desc LIMIT 1";
		return orderDao.findOne(sql);
	}

	@Override
	public int findTotalPrice(String fimOrderNo) {
		String sql = "select sum(ord_price) from jx_order where fim_ord_no = '"
				+ fimOrderNo + "' ";
		return jdbcTemplate.queryForInt(sql);
	}

	@Override
	public Map<String, Object> findTotalPrices(String fimOrderNo) {
		String sql = "select sum(ord_price) price,sum(sale_price) sale_price from jx_order where fim_ord_no = '"
				+ fimOrderNo + "'";
		return jdbcTemplate.queryForMap(sql);
	}

	@Override
	public List<Map<String, Object>> findState(String uid) {
		String sql = "select * from jx_order where u_id = '" + uid
				+ "' and ord_status=3 ";
		return jdbcTemplate.queryForList(sql);
	}

	// 获取总倍数
	@Override
	public int findppdnum(String uid) {
		String sql = "select sum(ord_multiple) from jx_order where u_id = '"
				+ uid + "' and ord_status=3";
		return jdbcTemplate.queryForInt(sql);
	}

	// 包年还是包流量
	@Override
	public int findYearsOrFlow(String uid) {
		String sql = "SELECT ord_protypeid FROM jx_order where u_id = '" + uid
				+ "' and ord_status = 3 ORDER BY ord_modtime DESC LIMIT 1";
		return jdbcTemplate.queryForInt(sql);
	}

	@Override
	public List<Map<String, Object>> findManagerNo(String managerNo) {
		String sql = "select * from jx_partner where id = '" + managerNo + "'";
		return jdbcTemplate.queryForList(sql);
	}

	@Override
	public Boolean queryPaternerByManagerNos(String managerNo) {
		String sql = "select count(*) from jx_partner where par_other = ? ";
		int i = this.jdbcTemplate.queryForInt(sql, managerNo);
		if (i > 0)
			return true;
		return false;
	}

	@Override
	public Page<JxOrder> findRzOrder(Page<JxOrder> page) {
		page = orderDao
				.findPageOnSql(
						page,
						"SELECT * from jx_order where ord_managerno LIKE '%A%' OR ord_managerno LIKE '%B%' OR ord_managerno LIKE '%C%'");
		return page;
	}

	@Override
	public Page<JxOrder> findOrdManagernoToOrders(Page<JxOrder> page,
			String string) {
		page = orderDao
				.findPageOnSql(page,
						"select * from jx_order where ord_managerno = '"
								+ string + "'");
		return page;
	}
	
	@Override
	public int updateTradeStateToSuccess(String addtime, String modtime,
			String user_name) {
		String sql = "update jx_order set trade_state = 200 where ord_managerno = '"
				+ user_name
				+ "' and ord_addtime <= '"
				+ addtime
				+ "' and ord_addtime > '" + modtime + "' and trade_state = 1 and ord_status IN(1,3,4,5)";
		return jdbcTemplate.update(sql);
	}

	@Override
	public int updateTradeStateToFail(String time, String last_add_time,
			String name) {
		String sql = "update jx_order set trade_state = 0 where ord_managerno = '"
				+ name
				+ "' and ord_addtime <= '"
				+ time
				+ "' and ord_addtime > '"
				+ last_add_time
				+ "' and trade_state = 1 and ord_status IN(1,3,4,5)";
		return jdbcTemplate.update(sql);

	}

	@Override
	public Page<JxOrder> findOrdManagernoToOrder(Page<JxOrder> page,
			String ord_managerno, String ord_status, String ord_no,
			String pro_id, String adr_id, String pro_no, Date ord_addtime,
			Date ord_modtime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql = "select * from jx_order where ";
		if(ord_managerno != null && ord_status ==null && ord_no == null && pro_id == null && adr_id == null && pro_no == null && ord_addtime == null && ord_modtime == null){
			sql = sql + "ord_managerno like '%" + ord_managerno + "%'";
			page = orderDao.findPageOnSql(page, sql);
			return page;
		}
		if(ord_status != null && !ord_status.equals("") && ord_managerno != null){
			ord_managerno = ord_managerno.substring(1, 11);
			sql = sql + "ord_status like '%" + ord_status + "%' and ord_managerno like '%" + ord_managerno + "%'";
			page = orderDao.findPageOnSql(page, sql);
			return page;
		}
		if(ord_no != null && !ord_no.equals("") && ord_managerno != null){
			ord_managerno = ord_managerno.substring(1, 11);
			sql = sql + "ord_no like '%" + ord_no + "%' and ord_managerno like '%" + ord_managerno + "%'";
			page = orderDao.findPageOnSql(page, sql);
			return page;
		} 
		if(pro_id != null && ord_managerno != null && !pro_id.equals("")){
			ord_managerno = ord_managerno.substring(1, 11);
			sql = sql + "pro_id like '%" + pro_id + "%' and ord_managerno like '%" + ord_managerno + "%'";
			page = orderDao.findPageOnSql(page, sql);
			return page;
		}
		if(adr_id != null && !adr_id.equals("") && ord_managerno != null){
			ord_managerno = ord_managerno.substring(1, 11);
			sql = sql + "adr_id like '%" + adr_id + "%' and ord_managerno like '%" + ord_managerno + "%'";
			page = orderDao.findPageOnSql(page, sql);
			return page;
		}
		if(pro_no != null && !pro_no.equals("") && ord_managerno != null){
			ord_managerno = ord_managerno.substring(1, 11);
			sql = sql + "pro_no like '%" + pro_no + "%' and ord_managerno like '%" + ord_managerno + "%'";
			page = orderDao.findPageOnSql(page, sql);
			return page;
		}
		if(ord_addtime != null && ord_modtime == null && ord_managerno != null){
			String addtime = sdf.format(ord_addtime);
			ord_managerno = ord_managerno.substring(1, 11);
			sql = sql + "ord_addtime >= '"+addtime+"' and ord_managerno like '%" + ord_managerno + "%'";
			page = orderDao.findPageOnSql(page, sql);
			return page;
		}
		if(ord_addtime == null && ord_modtime != null && ord_managerno != null){
			String modtime = sdf.format(ord_modtime);
			ord_managerno = ord_managerno.substring(1, 11);
			sql = sql + "ord_addtime <= '"+modtime+"' and ord_managerno like '%" + ord_managerno + "%'";
			page = orderDao.findPageOnSql(page, sql);
			return page;
		}
		if(ord_addtime != null && ord_modtime != null && ord_managerno != null){
			String addtime = sdf.format(ord_addtime);
			String modtime = sdf.format(ord_modtime);
			ord_managerno = ord_managerno.substring(1, 11);
			sql = sql + "ord_addtime >= '"+addtime+"' and ord_addtime < '"+modtime+"' and ord_managerno like '%" + ord_managerno + "%'";
			page = orderDao.findPageOnSql(page, sql);
			return page;
		}
		else{
			ord_managerno = ord_managerno.substring(1, 11);
			sql = sql + "ord_managerno like '%" + ord_managerno + "%' ";
			page = orderDao.findPageOnSql(page, sql);
			return page;
		}
	}

	@Override
	public Page<JxOrder> searchPages(Page<JxOrder> page,
			List<PropertyFilter> filters, Date ord_addtime, Date ord_modtime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql = "select * from jx_order where ";
		if(ord_addtime != null && ord_modtime == null){
			String addtime = sdf.format(ord_addtime);
			sql = sql + "ord_addtime >= '"+addtime+"'";
		}else{
			String addtime = null;
			if(ord_addtime == null){
				addtime = "1970-01-01 00:00:00";
			}else{
				addtime = sdf.format(ord_addtime);
			}
			String modtime = sdf.format(ord_modtime);
			sql = sql + "ord_addtime >= '"+addtime+"' and ord_addtime < '"+modtime+"' ";
		}
		page = orderDao.findPageOnSql(page, sql);
		return page;
	}

	@Override
	public Page<JxOrder> finOrderOftime(Page<JxOrder> page,
			String ord_managerno, String time, String last_time,int pageNo,int pageSize,String trade_state) {
		if("0".equals(trade_state)){
			String sql = "SELECT * from jx_order where ord_managerno = '"
					+ ord_managerno + "' and ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (4,5) and trade_state = 1";
			page = orderDao.findPageOnSql(page, sql);
		}else if("1".equals(trade_state)){
			String sql = "SELECT * from jx_order where ord_managerno = '"
					+ ord_managerno + "' and ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (4,5) and trade_state = 0 or trade_state = 1";
			page = orderDao.findPageOnSql(page, sql);
		}else if("200".equals(trade_state)){
			String sql = "SELECT * from jx_order where ord_managerno = '"
					+ ord_managerno + "' and ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (4,5) and trade_state = 200";
			page = orderDao.findPageOnSql(page, sql);
		}else{
			String sql = "SELECT * from jx_order where ord_managerno = '"
					+ ord_managerno + "' and ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (4,5) ";
			page = orderDao.findPageOnSql(page, sql);
		}
		
		return page;
	}

	@Override
	public Page<JxOrder> searchPagess(Page<JxOrder> page,
			List<PropertyFilter> filters, Date ord_addtime, Date ord_modtime,String ord_managerno,String trade_state) {
		String s = ord_managerno.substring(0, 10);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(ord_addtime);
		String last_time = sdf.format(ord_modtime);
		if("0".equals(trade_state)){
			String sql = "SELECT * from jx_order where ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (4,5) and ord_managerno like '%"+s+"%' and trade_state = 1";
			page = orderDao.findPageOnSql(page, sql);
		}else if("1".equals(trade_state)){
			String sql = "SELECT * from jx_order where ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (4,5) and ord_managerno like '%"+s+"%' and trade_state = 0 or trade_state = 1";
			page = orderDao.findPageOnSql(page, sql);
		}else if("200".equals(trade_state)){
			String sql = "SELECT * from jx_order where ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (4,5) and ord_managerno like '%"+s+"%' and trade_state = 200";
			page = orderDao.findPageOnSql(page, sql);
		}else{
			String sql = "SELECT * from jx_order where ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (4,5) and ord_managerno like '%"+s+"%'";
			page = orderDao.findPageOnSql(page, sql);
		}
		
		return page;
	}

	@Override
	public Page<JxOrder> finOrderOftimeTostatus(Page<JxOrder> page,
			String ord_managerno, String time, String last_time, int pageNo,
			int pageSize,String trade_state) {
		if("1".equals(trade_state)){
			String sql = "SELECT * from jx_order where ord_managerno = '"
					+ ord_managerno + "' and ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (1,3) and trade_state = 0 or trade_state = 1";
			page = orderDao.findPageOnSql(page, sql);
		}else if("0".equals(trade_state)){
			String sql = "SELECT * from jx_order where ord_managerno = '"
					+ ord_managerno + "' and ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (1,3) and trade_state = 1";
			page = orderDao.findPageOnSql(page, sql);
		}else if("200".equals(trade_state)){
			String sql = "SELECT * from jx_order where ord_managerno = '"
					+ ord_managerno + "' and ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (1,3) and trade_state = 200";
			page = orderDao.findPageOnSql(page, sql);
		}else{
			String sql = "SELECT * from jx_order where ord_managerno = '"
					+ ord_managerno + "' and ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (1,3) ";
			page = orderDao.findPageOnSql(page, sql);
		}
		return page;
	}

	@Override
	public Page<JxOrder> searchPagesss(Page<JxOrder> page,
			List<PropertyFilter> filters, Date ord_addtime, Date ord_modtime,
			String ord_managerno,String trade_state) {
		String s = ord_managerno.substring(0, 10);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(ord_addtime);
		String last_time = sdf.format(ord_modtime);
		if("0".equals(trade_state)){
			String sql = "SELECT * from jx_order where ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (1,3) and ord_managerno like '%"+s+"%' and trade_state = 1";
			page = orderDao.findPageOnSql(page, sql);
		}else if("1".equals(trade_state)){
			String sql = "SELECT * from jx_order where ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (1,3) and ord_managerno like '%"+s+"%' and trade_state = 0 or trade_state = 1";
			page = orderDao.findPageOnSql(page, sql);
		}else if("200".equals(trade_state)){
			String sql = "SELECT * from jx_order where ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (1,3) and ord_managerno like '%"+s+"%' and trade_state = 200";
			page = orderDao.findPageOnSql(page, sql);
		}else{
			String sql = "SELECT * from jx_order where ord_addtime <= '" + time
					+ "' and ord_addtime > '" + last_time
					+ "' and ord_status IN (1,3) and ord_managerno like '%"+s+"%'";
			page = orderDao.findPageOnSql(page, sql);
		}
		
		return page;
	}

	@Override
	public Page<JxOrder> searchPageToId(Page<JxOrder> page,
			List<PropertyFilter> filters, String s) {
		String sql = "select * from jx_order where ord_id in("+s+")";
		page = orderDao.findPageOnSql(page, sql);
		return page;
	}

	@Override
	public Page<JxOrder> searchPageToOrders(Page<JxOrder> page,
			List<PropertyFilter> filters, String order_no) {
		String sql = "select * from jx_order where ord_no = '"+order_no+"'";
		page = orderDao.findPageOnSql(page, sql);
		return page;
	}

	/**
	 * 新增的方法
	 * 2018-04-26
	 */
	@Override
	public int selectNumberOfInstalledIsers(String username) {
		String sql = "SELECT count(*) from jx_order where ord_managerno = '"
				+ username + "' and ord_status IN (1,3,4,5)";
		return jdbcTemplate.queryForInt(sql);
	}

	@Override
	public int selectNumberOfInstalledIsersThreeYears(String username) {
		String sql = "SELECT count(*) from jx_order where ord_managerno = '"
				+ username
				+ "' and ord_status IN (1,3,4,5) and ord_multiple >= 3";
		return jdbcTemplate.queryForInt(sql);
	}

}
