package com.game.bmanager.action;

import java.util.Date;
import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.game.services.account.AccountManager;
import com.game.services.account.DomainManager;
import com.game.smvc.entity.JxOrder;
import com.game.smvc.service.IJxBatchService;
import com.game.smvc.service.IJxOrderService;
import com.game.bmanager.service.IJxPartnerService;
import com.game.entity.account.User;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.orm.hibernate.HibernateUtils;
import com.game.modules.web.CrudActionSupport;
import com.game.modules.web.struts2.Struts2Utils;

@Namespace("/bmanager/order")
@Results({ @Result(name = "reload", location = "batchs.action?authId=${authId}", type = "redirect") })
public class BatchsAction extends CrudActionSupport<JxOrder>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7680327260962182295L;
	
	@Autowired
	private IJxOrderService orderService;
	@Autowired
	private DomainManager domainManager;
	@Autowired
	private AccountManager accountManager;
	@Autowired
    private IJxPartnerService partnerService;
	@Autowired
	private IJxBatchService jxBatchService;
	private JxOrder order;
	private User user;
	private AccountManager real_name;
	private Long id;
	private Long oldId;
	private List<Long> ids;
	private Page<JxOrder> page = new Page<JxOrder>(15);
	
	private Date ord_addtime;
	private Date ord_modtime;
	
	@Override
	public JxOrder getModel() {
		if (this.id != null) {
			this.order = ((JxOrder) orderService.get(this.id));
		} else {
			this.order = new JxOrder();
		}
		if(user==null){
	        user=super.getUser(); 
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

	//查询调用的方法
	@Override
	public String list() throws Exception {
		List<PropertyFilter> filters = HibernateUtils
				.buildPropertyFilters(Struts2Utils.getRequest());
		page = orderService.searchPage(page, filters);
		return SUCCESS;
	}

	//查询调用的方法
	public String selects() throws Exception {
		String order_no = Struts2Utils.getRequest().getParameter("odr");
		List<PropertyFilter> filters = HibernateUtils
				.buildPropertyFilters(Struts2Utils.getRequest());
		page = orderService.searchPageToOrders(page, filters,order_no);
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

	public User getUser() {
	    return user;
	}

	public void setUser(User user) {
	    this.user = user;
	}

	public AccountManager getReal_name() {
		return real_name;
	}

	public void setReal_name(AccountManager real_name) {
		this.real_name = real_name;
	}

	public Date getOrd_modtime() {
		return ord_modtime;
	}

	public void setOrd_modtime(Date ord_modtime) {
		this.ord_modtime = ord_modtime;
	}

	public Date getOrd_addtime() {
		return ord_addtime;
	}

	public void setOrd_addtime(Date ord_addtime) {
		this.ord_addtime = ord_addtime;
	}




}




