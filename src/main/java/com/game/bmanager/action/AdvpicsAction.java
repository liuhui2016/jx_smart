package com.game.bmanager.action;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.game.bmanager.entity.JxAdvpic;
import com.game.bmanager.entity.JxAdvpics;
import com.game.bmanager.entity.JxVideo;
import com.game.bmanager.service.IJxAdvpicService;
import com.game.bmanager.service.IJxAdvpicsService;
import com.game.bmanager.service.IJxVideoService;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.orm.hibernate.HibernateUtils;
import com.game.modules.web.CrudActionSupport;
import com.game.modules.web.struts2.Struts2Utils;
import com.game.util.Constants;
import com.game.util.Md5Encoder;


@Namespace("/bmanager/advpic")
@Results({ @Result(name = "reload", location = "advpics.action?authId=${authId}", type = "redirect") })
public class AdvpicsAction extends CrudActionSupport<JxAdvpics>{ 

	/**
	 * 
	 */
	private static final long serialVersionUID = -7851191912689823824L;
	
	@Autowired
	private IJxAdvpicsService advpicsService;
	
	private JxAdvpics advpics;
	
	private File iconfile;
	
	private File iconfiles;
	    
	private String iconfileFileName;
	
	private int is_accord;
	private String sup_id;
	
	private Long id;
	private Long oldId;
	private List<Long> ids;
	private Page<JxAdvpics> page = new Page<JxAdvpics>(15);
	
	private Page<JxAdvpics> pageResourcer = new Page<JxAdvpics>(10);

	@Override
	public JxAdvpics getModel() {
		if (this.id != null) {
			this.advpics = ((JxAdvpics) advpicsService.get(this.id));
		} else {
			this.advpics = new JxAdvpics();
		}
		return advpics;
	}

	@Override
	public String delete() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String input() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String list() throws Exception {
		List<PropertyFilter> filters = HibernateUtils
				.buildPropertyFilters(Struts2Utils.getRequest());
		if (!this.page.isOrderBySetted()) {
			this.page.setOrderBy("id");
			this.page.setOrder("desc");
			
		}
		page = advpicsService.searchPages(page, filters,advpics.getSup_id());
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
	
	public JxAdvpics getAdvpics() {
		return advpics;
	}

	public void setAdvpics(JxAdvpics advpics) {
		this.advpics = advpics;
	}

	public File getIconfile() {
		return iconfile;
	}

	public void setIconfile(File iconfile) {
		this.iconfile = iconfile;
	}

	public File getIconfiles() {
		return iconfiles;
	}

	public void setIconfiles(File iconfiles) {
		this.iconfiles = iconfiles;
	}

	public String getIconfileFileName() {
		return iconfileFileName;
	}

	public void setIconfileFileName(String iconfileFileName) {
		this.iconfileFileName = iconfileFileName;
	}

	public int getIs_accord() {
		return is_accord;
	}

	public void setIs_accord(int is_accord) {
		this.is_accord = is_accord;
	}

	public String getSup_id() {
		return sup_id;
	}

	public void setSup_id(String sup_id) {
		this.sup_id = sup_id;
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

	public Page<JxAdvpics> getPage() {
		return page;
	}

	public void setPage(Page<JxAdvpics> page) {
		this.page = page;
	}

	public Page<JxAdvpics> getPageResourcer() {
		return pageResourcer;
	}

	public void setPageResourcer(Page<JxAdvpics> pageResourcer) {
		this.pageResourcer = pageResourcer;
	}

	

	

}
