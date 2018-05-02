package com.game.bmanager.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.game.bmanager.entity.JxPartnerRebate;
import com.game.bmanager.entity.JxWithdrawalOrder;
import com.game.bmanager.service.IJxPartnerRebateService;
import com.game.bmanager.service.IJxWithdrawalOrderService;
import com.game.entity.account.User;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.orm.hibernate.HibernateUtils;
import com.game.modules.web.CrudActionSupport;
import com.game.modules.web.struts2.Struts2Utils;
import com.game.services.account.AccountManager;
import com.game.services.account.DomainManager;
import com.game.smvc.util.RandomUtil;

@Namespace("/bmanager/trade")
@Results({ @Result(name = "reload", location = "trade.action?authId=${authId}", type = "redirect") })
public class TradeAction extends CrudActionSupport<JxWithdrawalOrder> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private IJxWithdrawalOrderService jxWithdrawalOrderService;
	@Autowired
	private IJxPartnerRebateService jxPartnerRebateService;
	@Autowired
	private DomainManager domainManager;
	@Autowired
	private AccountManager accountManager;
	private JxWithdrawalOrder jxWithdrawalOrder;
	
	private User user;
	private String withdrawal_order;
	private JxPartnerRebate jxPartnerRebate;

	private Long id;
	private Long oldId;
	private List<Long> ids;
	private Page<JxWithdrawalOrder> page = new Page<JxWithdrawalOrder>(15);
	private Page<JxPartnerRebate> pages = new Page<JxPartnerRebate>(15);

	@Override
	public JxWithdrawalOrder getModel() {
		if (this.id != null) {
			this.jxWithdrawalOrder = ((JxWithdrawalOrder) jxWithdrawalOrderService
					.get(this.id));
		} else {
			this.jxWithdrawalOrder = new JxWithdrawalOrder();
		}
		
		if (this.id != null) {
			this.jxPartnerRebate = ((JxPartnerRebate) jxPartnerRebateService
					.get(this.id));
		} else {
			this.jxPartnerRebate = new JxPartnerRebate();
		}
		
		if (user == null) {
			user = super.getUser();
		}
		
		return jxWithdrawalOrder;
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
		List<PropertyFilter> filters = HibernateUtils
				.buildPropertyFilters(Struts2Utils.getRequest());
		if (!this.page.isOrderBySetted()) {
			this.page.setOrderBy("withdrawal_state,add_time");
			this.page.setOrder("asc,desc");
		}
		String userid = user.getUsername();
		if("admin".equals(userid)){
			page = jxWithdrawalOrderService.searchPage(page, filters);
			//page = jxWithdrawalOrderService.dimQueryAll(page);
		}else{
			System.out.println("010102");
			page = jxWithdrawalOrderService.dimQueryOfUserid(page,userid);
			
		}
		return SUCCESS;
	}
	
	public String lists() throws Exception {
		page = jxWithdrawalOrderService.dimQueryOfRebates(page,withdrawal_order);
		return SUCCESS;
	}

	@Override
	protected void prepareModel() throws Exception {

	}

	@Override
	public String save() throws Exception {
		return "saves";
	}

	public JxWithdrawalOrder getJxWithdrawalOrder() {
		return jxWithdrawalOrder;
	}

	public void setJxWithdrawalOrder(JxWithdrawalOrder jxWithdrawalOrder) {
		this.jxWithdrawalOrder = jxWithdrawalOrder;
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

	public Page<JxWithdrawalOrder> getPage() {
		return page;
	}

	public void setPage(Page<JxWithdrawalOrder> page) {
		this.page = page;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public JxPartnerRebate getJxPartnerRebate() {
		return jxPartnerRebate;
	}

	public void setJxPartnerRebate(JxPartnerRebate jxPartnerRebate) {
		this.jxPartnerRebate = jxPartnerRebate;
	}

	public String getWithdrawal_order() {
		return withdrawal_order;
	}

	public void setWithdrawal_order(String withdrawal_order) {
		this.withdrawal_order = withdrawal_order;
	}

	public Page<JxPartnerRebate> getPages() {
		return pages;
	}

	public void setPages(Page<JxPartnerRebate> pages) {
		this.pages = pages;
	}
	
}
