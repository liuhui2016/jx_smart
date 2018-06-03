package com.game.bmanager.action;

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
import com.game.bmanager.service.IJxPartnerService;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.orm.hibernate.HibernateUtils;
import com.game.modules.web.CrudActionSupport;
import com.game.modules.web.struts2.Struts2Utils;

@Namespace("/bmanager/partner")
@Results({ @Result(name = "reload", location = "orders.action?id=${id}", type = "redirect") })
public class OrdersAction extends CrudActionSupport<JxOrder>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7680327260962182295L;
	
	@Autowired
	private IJxOrderService orderService;
	 
    @Autowired
    private IJxPartnerService partnerService;
    
	private JxOrder order;
	
	private JxPartner partner;
	
	private String ord_managerno;
	
	private String ord_status;
	private String ord_no;
	private String pro_id;
	private String adr_id;
	private String pro_no;
	private Date ord_addtime;
	private Date ord_modtime;
	
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
	
	
	
	@Override
	public String list() throws Exception {
		JxPartner jxPartner = partnerService.findUnique("from JxPartner where id = '"+ord_managerno+"'");
		if(jxPartner.getPAR_OTHER() != null){
			ord_managerno = jxPartner.getPAR_OTHER();
		}
		page = orderService.findOrdManagernoToOrder(page,ord_managerno,ord_status,ord_no,pro_id,adr_id,pro_no,ord_addtime,ord_modtime);
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

	public JxPartner getPartner() {
		return partner;
	}

	public void setPartner(JxPartner partner) {
		this.partner = partner;
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
	
	

}
