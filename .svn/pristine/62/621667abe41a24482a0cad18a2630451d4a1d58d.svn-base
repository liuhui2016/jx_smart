package com.game.bmanager.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.game.smvc.entity.JxOrder;
import com.game.smvc.service.IJxOrderService;
import com.game.bmanager.entity.JxPartner;
import com.game.bmanager.entity.JxWithdrawalOrder;
import com.game.bmanager.service.IJxPartnerService;
import com.game.bmanager.service.IJxWithdrawalOrderService;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.orm.hibernate.HibernateUtils;
import com.game.modules.web.CrudActionSupport;
import com.game.modules.web.struts2.Struts2Utils;

@Namespace("/bmanager/trade")
@Results({ @Result(name = "reload", location = "orderss.action?trade_state=${trade_state}&id=${id}&ord_addtime=${ord_addtime}&ord_modtime=${ord_modtime}&ord_status=${ord_status}", type = "redirect") })
public class OrderssAction extends CrudActionSupport<JxOrder>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7680327260962182295L;
	
	@Autowired
	private IJxOrderService orderService;
	@Autowired
	private IJxWithdrawalOrderService jxWithdrawalOrderService; 
   
    
	private JxOrder order;
	
	private JxWithdrawalOrder jxWithdrawalOrder;
	private String ord_managerno;
	
	private String ord_status;
	private String ord_no;
	private String pro_id;
	private String adr_id;
	private String pro_no;
	private Date ord_addtime;
	private Date ord_modtime;
	private String trade_state;
	
	private Long id;
	private Long oldId;
	private List<Long> ids;
	private Page<JxOrder> page = new Page<JxOrder>(15);
	
	@Override
	public JxOrder getModel() {//得到order模块
		if (this.id != null) {
			this.order = ((JxOrder) orderService.get(this.id));
		} else {
			this.order = new JxOrder();
		}
		return order;
	}

	@Override
	public String delete() throws Exception {
		return null;
	}

	@Override
	public String input() throws Exception {
		return null;
	}
	
	
	public String lists() throws Exception {
		List<PropertyFilter> filters = HibernateUtils
				.buildPropertyFilters(Struts2Utils.getRequest());
		if (!this.page.isOrderBySetted()) {
			this.page.setOrderBy("ord_managerno");
		}
		page = orderService.searchPagess(page, filters,ord_addtime,ord_modtime,ord_managerno,trade_state);
		return SUCCESS;
	}
	
	@Override
	public String list() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(ord_addtime);
		String last_time = sdf.format(ord_modtime);
		page = orderService.finOrderOftime(page,ord_managerno,time,last_time,page.getPageNo(),page.getPageSize(),trade_state);
		return SUCCESS;
	}

	@Override
	protected void prepareModel() throws Exception {
		
	}

	@Override
	public String save() throws Exception {
		return null;
	}

	public JxOrder getOrder() {
		return order;
	}

	public void setOrder(JxOrder order) {
		this.order = order;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getOldId() {
		return oldId;
	}

	public void setOldId(Long oldId) {
		this.oldId = oldId;
	}

	public List<Long> getIds() {
		return ids;
	}

	public void setIds(List<Long> ids) {
		this.ids = ids;
	}

	public Page<JxOrder> getPage() {
		return page;
	}

	public void setPage(Page<JxOrder> page) {
		this.page = page;
	}

	public String getOrd_managerno() {
		return ord_managerno;
	}

	public void setOrd_managerno(String ord_managerno) {
		this.ord_managerno = ord_managerno;
	}


	public String getOrd_status() {
		return ord_status;
	}

	public void setOrd_status(String ord_status) {
		this.ord_status = ord_status;
	}

	public String getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(String ord_no) {
		this.ord_no = ord_no;
	}

	public String getPro_id() {
		return pro_id;
	}

	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}

	public String getAdr_id() {
		return adr_id;
	}

	public void setAdr_id(String adr_id) {
		this.adr_id = adr_id;
	}

	public String getPro_no() {
		return pro_no;
	}

	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}

	public Date getOrd_addtime() {
		return ord_addtime;
	}

	public void setOrd_addtime(Date ord_addtime) {
		this.ord_addtime = ord_addtime;
	}

	public Date getOrd_modtime() {
		return ord_modtime;
	}

	public void setOrd_modtime(Date ord_modtime) {
		this.ord_modtime = ord_modtime;
	}

	public JxWithdrawalOrder getJxWithdrawalOrder() {
		return jxWithdrawalOrder;
	}

	public void setJxWithdrawalOrder(JxWithdrawalOrder jxWithdrawalOrder) {
		this.jxWithdrawalOrder = jxWithdrawalOrder;
	}

	public String getTrade_state() {
		return trade_state;
	}

	public void setTrade_state(String trade_state) {
		this.trade_state = trade_state;
	}
	
	

}
