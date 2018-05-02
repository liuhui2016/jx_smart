package com.game.bmanager.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.game.bmanager.entity.JxDrawPeople;
import com.game.bmanager.entity.JxPartnerRebate;
import com.game.bmanager.entity.JxWithdrawalOrder;
import com.game.bmanager.service.IJxDrawPeopleService;
import com.game.bmanager.service.IJxPartnerRebateService;
import com.game.bmanager.service.IJxWithdrawalOrderService;
import com.game.entity.account.User;
import com.game.modules.orm.Page;
import com.game.modules.web.CrudActionSupport;
import com.game.services.account.AccountManager;
import com.game.services.account.DomainManager;
import com.game.smvc.controller.PushPartnerController;
import com.game.smvc.entity.JxPartnerMessages;
import com.game.smvc.service.IJxOrderService;
import com.game.smvc.service.IJxPartnerMessagesService;

@Namespace("/bmanager/trade")
@Results({ @Result(name = "reload", location = "tradesss.action?authId=${authId}", type = "redirect") })
public class TradesssAction extends CrudActionSupport<JxWithdrawalOrder> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private IJxWithdrawalOrderService jxWithdrawalOrderService;
	@Autowired
	private IJxPartnerRebateService jxPartnerRebateService;
	@Autowired
	private IJxDrawPeopleService jxDrawPeopleService;
	@Autowired
	private DomainManager domainManager;
	@Autowired
	IJxOrderService jxOrderService;
	@Autowired
	private IJxPartnerMessagesService jxPartnerMessagesService;
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
		String userid = user.getUsername();
		if("admin".equals(userid)){
			page = jxWithdrawalOrderService.dimQueryAll(page);
		}else{
			page = jxWithdrawalOrderService.dimQueryOfUserid(page,userid);
			
		}
		return SUCCESS;
	}
	
	public String lists() throws Exception {
		page = jxWithdrawalOrderService.dimQueryOfRebates(page,jxPartnerRebate.getWithdrawal_order());
		return "trades";
	}

	@Override
	protected void prepareModel() throws Exception {

	}
	
	public String saves()throws Exception {	
		String withdrawal_order = jxWithdrawalOrder.getWithdrawal_order();
		String s1 = jxWithdrawalOrder.getWithdrawal_reason();
		JxWithdrawalOrder jxWithdrawalOrder = jxWithdrawalOrderService
				.findUnique("from JxWithdrawalOrder where withdrawal_order = '"
						+ withdrawal_order + "' and withdrawal_state = 0 ");
		
		JxPartnerRebate jxPartnerRebate = jxPartnerRebateService
				.findUnique("from jx_partner_rebate where withdrawal_order = '"
						+ withdrawal_order + "'");
		// 取出最后一次提现的时间
		List<Map<String, Object>> mm = jxPartnerRebateService
				.findLastAddtimes(jxPartnerRebate.getUser_name());
		String last_add_time = null;
		SimpleDateFormat sdf = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		if (mm.size() <= 0) {
			last_add_time = "1970-01-01 00:00:00";
		} else {
			Map<String, Object> ma = mm.get(0);
			Date s = (Date) ma.get("add_time");
			last_add_time = sdf.format(s);
		}
		Date t = jxPartnerRebate.getAdd_time();
		String time = sdf.format(t);
		jxPartnerRebate.setW_state(1);// 审核失败
		String name = jxPartnerRebate.getUser_name();
		System.out.println("name:"+name);
		jxWithdrawalOrder.setWithdrawal_state(1);// //审核失败
		jxWithdrawalOrder.setWithdrawal_reason(s1);
		jxPartnerRebate.setWithdrawal_state(1);
		jxPartnerRebateService.save(jxPartnerRebate);
		jxWithdrawalOrderService.save(jxWithdrawalOrder);
		System.out.println("01");
		System.out.println("time:"+time);
		System.out.println("last_add_time:"+last_add_time);
		System.out.println("0001");
		@SuppressWarnings("unused")
		int jxOrder = jxOrderService.updateTradeStateToFail(
				time, last_add_time, name);
		System.out.println("02");
		int update_state = jxDrawPeopleService.findupdate_states(withdrawal_order);
		// 提现消息推送
		String alias = jxWithdrawalOrder.getUser_number();
		String title = "提现消息";
		String content = "您刚发起的提现单(" + withdrawal_order
				+ "),审核失败,原因可查看提现记录。";
		int p_type = 9;
		PushPartnerController.PartnerMssage(alias, title,
				content);
		JxPartnerMessages mess = PushPartnerController
				.partnerMessage(withdrawal_order, content,
						alias, title, p_type);
		jxPartnerMessagesService.save(mess);
		
		page = jxWithdrawalOrderService.dimQueryAll(page);
		return "saves";
		
	}

	@Override
	public String save() throws Exception {
		String withdrawal_order = jxWithdrawalOrder.getWithdrawal_order();
		JxWithdrawalOrder jxWithdrawalOrder = jxWithdrawalOrderService
				.findUnique("from JxWithdrawalOrder where withdrawal_order = '"
						+ withdrawal_order + "' and withdrawal_state = 0 ");
	
		if(jxWithdrawalOrder == null){
			page = jxWithdrawalOrderService.dimQueryAll(page);
			return "saves";
		}else{
			String person = jxWithdrawalOrder.getAudit_person();
			if(person == null || person.equals("admin")){
				jxWithdrawalOrder.setAudit_time(new Date());
				jxWithdrawalOrderService.save(jxWithdrawalOrder);
				return withdrawal_order;
			}else{
				page = jxWithdrawalOrderService.dimQueryAll(page);
				return "saves";
			}
		}
		
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
