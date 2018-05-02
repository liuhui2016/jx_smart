package com.game.smvc.service.impl;

import java.util.ArrayList;
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
import com.game.smvc.entity.JxOrder;
import com.game.smvc.service.IJxOrderService;
@Service("jxOrderService")
public class JxOrderServiceImpl extends GenericManagerImpl<JxOrder, Long> implements IJxOrderService{
    private GenericDao<JxOrder, Long> orderDao;
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public JxOrderServiceImpl(SessionFactory sessionFactory,DataSource dataSource) {
        this.orderDao = new GenericDaoHibernate<JxOrder,Long>(JxOrder.class,
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
	//通过id查看地址详情
	@Override
	public Map<String, Object> findAddressById(Long id) {
		Map<String, Object> map = jdbcTemplate.queryForMap("select adr_name name,CONCAT(adr_area,adr_detail) address,adr_phone phone from jx_address where adr_id = ?",id);
		return map;
	}
	//根据经理编号查看经理是否存在
	@Override
	public Boolean queryPaternerByManagerNo(String managerNo) {
		String sql="select count(*) from jx_partner where id=?";
		int i = this.jdbcTemplate.queryForInt(sql,managerNo);
		if(i>0)
			return true;
		return false;
	}
	//查看商品名字
	@Override
	public String findProNameById(Long pro_id) {
		String sql="select prot_name name from jx_prototal where id=?";
		return (String)jdbcTemplate.queryForObject(sql, String.class, pro_id);
	}
	
	
	
	/*
	 * 跟据产品号查询服务包年还是包流量
	 * 
	 */
	@Override
	public String findpayWayByProNo(String pro_no) {

		String sql="SELECT B.PAY_TYPENAME name FROM "
				+ "JX_ORDER A INNER JOIN JX_PAY B ON A.ORD_PROTYPEID=B.PAY_ID"
				+" where A.pro_no=? and A.ord_status=3";
		return this.jdbcTemplate.queryForObject(sql, new Object[]{pro_no},String.class);
	}
	
	/*
	 * 根据产品编号查询服务详情
	 * 
	 */
	@Override
	public List<Map<String, Object>> findServiceDetailByProNo(String pro_no) {
		
		String sql="SELECT o.pro_id productId,o.ord_no,o.ord_receivename name,o.ord_phone phone,p.pro_no,CAST(o.ORD_PRICE AS CHAR(20)) ord_price,DATE_FORMAT(p.pro_addtime,'%Y-%m-%d') pro_addtime,DATE_FORMAT(p.pro_invalidtime,'%Y-%m-%d') pro_invalidtime,p.pro_hasflow,p.pro_restflow,o.pro_restflow restflow,o.ord_protypeid type,"
				+"'1' as sharetype,p.pro_name,o.ord_color from jx_order o,jx_product p where o.pro_no=p.pro_no and p.pro_no=? and o.ord_status=3";
				return jdbcTemplate.queryForList(sql,pro_no);
	}
	/*
	 *  查询所有消息列表
	 */
	@Override
	public List<Map<String, Object>> queryAllMess(String uid,String page) {
		//String sql="select * from jx_messages where u_id=? order by id limit ?,10";
		//String sql="select * from jx_messages where u_id=? order by isread ASC limit ?,10";
		String sql="select * from jx_messages where u_id=? order by isread ASC,message_time DESC limit ?,10";
		List<Map<String,Object>> list = jdbcTemplate.queryForList(sql,uid,(Integer.parseInt(page)-1)*10);
		System.out.println(list);
			return list;
	}


	//修改已读未读
	@Override
	public int updateMessageStatusById(String id) {
		String sql="update jx_messages set isread = 1 where id = ?";
		
		return jdbcTemplate.update(sql,id);
	}
	/*
	 * 
	 * 查看续费订单详情
	 */
	@Override
	public List<Map<String, List<Map<String, Object>>>> findAgainOrderDetailByOno(String ono,String productId) {
		
		// TODO
		String sql="SELECT A.ORD_NO ordNo,D.prod_name proname,A.ord_receivename name,A.adr_id address,A.ord_color color,A.ord_imgurl url,ord_protypeid paytype,A.ord_ordertype isagain,"
				+ "A.ord_phone phone,A.ord_sertime serttime,A.ord_way way,CAST(A.ORD_PRICE AS CHAR(20))  price,A.ORD_STATUS status FROM jx_order A,jx_user B,"
				+ "jx_prodetail D where A.u_id=B.u_id  and A.pro_id=D.prot_id and A.ord_no=? limit 0,1";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql,ono);
		
		
		String sql2 = "select pay_typename paytype,CAST(pay_totalmoney AS CHAR(20)) price from jx_pay where pay_typeid=?";

		List<Map<String, Object>> listpay = this.jdbcTemplate.queryForList(sql2,productId);
		List<Map<String, List<Map<String, Object>>>> l = new ArrayList<Map<String, List<Map<String, Object>>>>();
		Map<String, List<Map<String, Object>>> map = new HashMap<String, List<Map<String, Object>>>();
		map.put("orderdetail", list);
		map.put("paytype", listpay);
		l.add(map);
		return l;

	}
	
    @Override
    public JxOrder queryOrderByProno(String pro_no) {
        String hql = "from JxOrder where pro_no='"+pro_no+"' and ord_status=3";
        return orderDao.findOne(hql);
    }
    
	
    
	@SuppressWarnings("unused")
	@Override
	public List<Map<String, Object>> findServiceDetailByProNo(String pro_no,
			String user) {
		String uid = jdbcTemplate.queryForObject("select u_id from jx_product where pro_no=?", String.class,pro_no);  
		if(user.equals(uid)){
			String sql="SELECT o.pro_id productId,o.ord_no,o.ord_receivename name,o.ord_phone phone,p.pro_no,CAST(o.ORD_PRICE AS CHAR(20)) ord_price,DATE_FORMAT(p.pro_addtime,'%Y-%m-%d') pro_addtime,DATE_FORMAT(p.pro_invalidtime,'%Y-%m-%d') pro_invalidtime,p.pro_hasflow,p.pro_restflow,o.ord_protypeid type,"
					+"'0' as sharetype,p.pro_name,o.ord_color from jx_order o,jx_product p where o.pro_no=p.pro_no and p.pro_no=? and o.ord_status=3";
		}
			
		String sql="SELECT o.pro_id productId,o.ord_no,o.ord_receivename name,o.ord_phone phone,p.pro_no,CAST(o.ORD_PRICE AS CHAR(20)) ord_price,DATE_FORMAT(p.pro_addtime,'%Y-%m-%d') pro_addtime,DATE_FORMAT(p.pro_invalidtime,'%Y-%m-%d') pro_invalidtime,p.pro_hasflow,p.pro_restflow,o.ord_protypeid type,"
				+"'1' as sharetype,p.pro_name,o.ord_color from jx_order o,jx_product p where o.pro_no=p.pro_no and p.pro_no=? and o.ord_status=3";
	return jdbcTemplate.queryForList(sql,pro_no);
	
	}
	
	//解绑的方法
	@Override
	public List<Map<String, List<Map<String, Object>>>> unTabletBinding(
			int id) {
		//查询是否有此订单
		String sql = "select ord_status from jx_order where ord_no=? ";
		//剩余流量和已用流量
		//String sql = "select pro_hasflow,pro_restflow from jx_product where pro_id = ?";
		List<Map<String, Object>> status = this.jdbcTemplate.queryForList(sql, id);
		//用户名
		//String sql1 = "select u_name from jx_user where u_id = ?";
		//List<Map<String, Object>> names = this.jdbcTemplate.queryForList(sql1, id);
		//状态判断
		/*String sql2  ="update jx_order set ord_status = 6 where ord_no = ? ";
		List<Map<String, Object>> statu = this.jdbcTemplate.queryForList(sql1, id);*/
		//UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值
		List<Map<String, List<Map<String, Object>>>> list = new ArrayList<Map<String, List<Map<String, Object>>>>();
		Map<String, List<Map<String, Object>>> map = new HashMap<String, List<Map<String, Object>>>();
		map.put("orderno", status);
		//map.put("name", names);
		//map.put("statu", statu);
		list.add(map);
		return list;
	}
	//修改状态的方法
	@Override
	public int updateStatusAndProNo(String pro_no) {
		String sql = "update jx_order set ord_status=1 where ord_no=?";
		return jdbcTemplate.update(sql,pro_no);
	}
	
	//查看商品类型
	@Override
	public int selectType(String orderno) {
		String sql = "select pro_id from jx_order where ord_no = "+orderno;
		return jdbcTemplate.queryForInt(sql);
		
	}
	@Override
	public String findProNameByIds(int pro_id) {
		String sql="select prot_name name from jx_prototal where id=?";
		return (String)jdbcTemplate.queryForObject(sql, String.class, pro_id);
	}
	@Override
	public JxOrder selectOrdernoByProno(String prono) {
		String sql = "select * from jx_order where pro_no='"+prono+"' and ord_status=4 ORDER BY ord_id asc LIMIT 1";
		return orderDao.findOne(sql);
	}
	//查看平板续费订单
	@Override
	public List<Map<String, Object>> selectOrdernoByPronos(String prono) {
		String sql = "select * from jx_order where pro_no='"+prono+"' and ord_status=4 ORDER BY ord_id asc LIMIT 1";
		return jdbcTemplate.queryForList(sql);
	}
	
	//查看合肥市的用户人数
	@Override
	public int selectCity(String city) {
		//String sql = "select * from jx_order where adr_id like '%"+city+"%'";
		//String sql = "select count(distinct u_id) from jx_order where adr_id like '%"+city+"%'";
		String sql = "select count(u_id) from jx_order where adr_id like '%"+city+"%'";
		return jdbcTemplate.queryForInt(sql);
	}
	
	//得到今日饮水量的数量
	@Override
	public int findwater(String uid) {
		String sql = "select sum(pro_restflow) from jx_order where u_id = '"+uid+"' and ord_status=3"; 
		return jdbcTemplate.queryForInt(sql);
	}
	@Override
	public List<Map<String, Object>> findrestflow(String uid) {
		String sql = "select pro_restflow,ord_modtime from jx_order where u_id = '"+uid+"' and ord_status=3";
		return jdbcTemplate.queryForList(sql);
	}
	@Override
	public int findnumber(String uid) {
		String sql = "select count(*) from jx_order where u_id = '"+uid+"' and ord_status=3";
		return jdbcTemplate.queryForInt(sql);
	}
	@Override
	public List<Map<String, Object>> findtime(String uid) {
		String sql = "select ord_modtime from jx_order where u_id = '"+uid+"' and ord_status=3 order by ord_modtime desc LIMIT 1";
		return jdbcTemplate.queryForList(sql);
	}
	
	//总押金
	@Override
	public int findmuit(String s) {
		String sql = "select sum(ord_pledge) from jx_order where fim_ord_no = "+s;
		return jdbcTemplate.queryForInt(sql);
	}
	@Override
	public int updatemultiple(String ono) {
		String sql = "update jx_order set ord_multiple = 1 where ord_no = "+ono;
		return jdbcTemplate.update(sql);
	}
	@Override
	public JxOrder findall(String ono) {
		String sql = "from jx_order where ord_no = "+ono;
		return orderDao.findOne(sql);
	}
	@Override
	public JxOrder findorder(String ono) {
		String sql = "from jx_order where ord_no =  '"+ono+"' or fim_ord_no = '"+ono+"' order by ord_id desc LIMIT 1";
		return orderDao.findOne(sql);
	}
	@Override
	public int findTotalPrice(String fimOrderNo) {
		String sql = "select sum(ord_price) from jx_order where fim_ord_no = '"+fimOrderNo+"' ";
		return jdbcTemplate.queryForInt(sql);
	}
	@Override
	public Map<String,Object> findTotalPrices(String fimOrderNo) {
		String sql = "select sum(ord_price) price from jx_order where fim_ord_no = '"+fimOrderNo+"'";
		return jdbcTemplate.queryForMap(sql);
	}
	@Override
	public List<Map<String, Object>> findState(String uid) {
		String sql = "select * from jx_order where u_id = '"+uid+"' and ord_status=3 ";
		return jdbcTemplate.queryForList(sql);
	}
	
	//获取总倍数
	@Override
	public int findppdnum(String uid) {
		String sql = "select sum(ord_multiple) from jx_order where u_id = '"+uid+"' and ord_status=3";
		return jdbcTemplate.queryForInt(sql);
	}
	//包年还是包流量
	@Override
	public int findYearsOrFlow(String uid) {
		String sql = "SELECT ord_protypeid FROM jx_order where u_id = '"+uid+"' and ord_status = 3 ORDER BY ord_modtime DESC LIMIT 1";
		return jdbcTemplate.queryForInt(sql);
	}
	
		
}
