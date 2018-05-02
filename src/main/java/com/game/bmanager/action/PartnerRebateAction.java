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
import com.game.modules.orm.Page;
import com.game.modules.web.CrudActionSupport;

@Namespace("/bmanager/trade")
@Results({ @Result(name = "reload", location = "partnerRebate.action?id=${id}", type = "redirect") })
public class PartnerRebateAction extends CrudActionSupport<JxPartnerRebate>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private IJxWithdrawalOrderService jxWithdrawalOrderService;
	@Autowired
	private IJxPartnerRebateService jxPartnerRebateService;
	private JxWithdrawalOrder jxWithdrawalOrder;
	private JxPartnerRebate jxPartnerRebate;

	private Long id;
	private Long oldId;
	private List<Long> ids;
	private Page<JxPartnerRebate> page = new Page<JxPartnerRebate>(15);
	@Override
	public JxPartnerRebate getModel() {
		if (this.id != null) {
			this.jxPartnerRebate = ((JxPartnerRebate) jxPartnerRebateService
					.get(this.id));
		} else {
			this.jxPartnerRebate = new JxPartnerRebate();
		}
		return jxPartnerRebate;
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
		System.out.println(jxPartnerRebate.getWithdrawal_order());
		page = jxPartnerRebateService.dimQueryOfRebates(page,jxPartnerRebate.getWithdrawal_order());
		return SUCCESS;
	}

	@Override
	protected void prepareModel() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String save() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public JxWithdrawalOrder getJxWithdrawalOrder() {
		return jxWithdrawalOrder;
	}

	public void setJxWithdrawalOrder(JxWithdrawalOrder jxWithdrawalOrder) {
		this.jxWithdrawalOrder = jxWithdrawalOrder;
	}

	public JxPartnerRebate getJxPartnerRebate() {
		return jxPartnerRebate;
	}

	public void setJxPartnerRebate(JxPartnerRebate jxPartnerRebate) {
		this.jxPartnerRebate = jxPartnerRebate;
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

	public Page<JxPartnerRebate> getPage() {
		return page;
	}

	public void setPage(Page<JxPartnerRebate> page) {
		this.page = page;
	}

}
