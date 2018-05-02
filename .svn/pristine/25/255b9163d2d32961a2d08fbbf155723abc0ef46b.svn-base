package com.game.smvc.service;

import java.util.List;
import java.util.Map;

import com.game.modules.service.GenericManager;
import com.game.smvc.entity.JxOrder;

public interface IJxOrderService extends GenericManager<JxOrder, Long>{

	
	
	int modifyOrderStatus(String out_trade_no);
	//根据订单号删除订单
	Boolean deleteProductByordNo(String id);
	Map<String, Object> findAddressById(Long id);
	Boolean queryPaternerByManagerNo(String managerNo);
	String findProNameById(Long pro_id);
	String findpayWayByProNo(String pro_no);
	List<Map<String, Object>> findServiceDetailByProNo(String pro_no);
	List<Map<String, Object>> queryAllMess(String uid,String page);
	int updateMessageStatusById(String id);
	//查看续费订单详情
	List<Map<String, List<Map<String, Object>>>> findAgainOrderDetailByOno(String ono,String productId);
	//查询当前生效的订单
    JxOrder queryOrderByProno(String pro_no);
	List<Map<String, Object>> findServiceDetailByProNo(String pro_no,String user);
	int updateStatusAndProNo(String pro_no);
	List<Map<String, List<Map<String, Object>>>> unTabletBinding(int id);
	int selectType(String orderno);
	String findProNameByIds(int pro_id);
	JxOrder selectOrdernoByProno(String prono);
	List<Map<String, Object>> selectOrdernoByPronos(String prono);
	int selectCity(String city);
	int findwater(String uid);
	List<Map<String, Object>> findrestflow(String uid);
	int findnumber(String uid);
	List<Map<String, Object>> findtime(String uid);
	int findmuit(String s);
	int updatemultiple(String ono);
	JxOrder findall(String ono);
	JxOrder findorder(String ono);
	int findTotalPrice(String fimOrderNo);
	Map<String,Object> findTotalPrices(String fimOrderNo);
	List<Map<String, Object>> findState(String uid);
	int findppdnum(String uid);
	int findYearsOrFlow(String uid);
	
	
	
}
