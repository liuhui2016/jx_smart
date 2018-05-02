package com.game.bmanager.action;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.game.bmanager.entity.JxPartner;
import com.game.bmanager.service.IJxPartnerService;
import com.game.comm.entity.AreaCode;
import com.game.comm.service.IAreaCodeService;
import com.game.entity.account.Domain;
import com.game.entity.account.Role;
import com.game.entity.account.User;
import com.game.modules.orm.Page;
import com.game.modules.web.CrudActionSupport;
import com.game.modules.web.struts2.Struts2Utils;
import com.game.services.account.AccountManager;
import com.game.services.account.DomainManager;

@Namespace("/bmanager/partner")
@Results({ @Result(name = "reload", location = "partners.action?authId=${authId}", type = "redirect") })
public class PartnersAction extends CrudActionSupport<JxPartner>{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    @Autowired
    private IJxPartnerService partnerService;
    @Autowired
    private DomainManager domainManager;
    @Autowired
    private AccountManager accountManager;
    @Autowired
    private IAreaCodeService areaCodeService;
    
    private Page<JxPartner> pageResourcer = new Page<JxPartner>(10);
    
    
    private JxPartner entity;
    
    private String s_province;
    
    private String s_city;
    
    private String s_county;

    private String par_level;
    
    private String par_names;
    
    private String parName;
    
    private Long parId;
    
    private User user;
    
    private AreaCode areaCode;
    
    private String parParentid;
   

	private Long id;
    private Long oldId;
    private List<Long> ids;
    private Page<JxPartner> page = new Page<JxPartner>(15);
    
    @Override
    public JxPartner getModel() {
    	//FriendCompany
    	
        if (this.id != null) {
            this.entity = ((JxPartner) partnerService.get(this.id));
            String pararea = entity.getPAR_AREA();
            if(entity.getPAR_LEVEL().equals("1")){
                s_province=pararea;
                s_city="地级市";
                s_county="市、县级市";
            }else if(entity.getPAR_LEVEL().equals("2")){
                s_province=pararea.split("-")[0];
                s_city=pararea.split("-")[1];
                s_county="市、县级市";
            }else{
                s_province=pararea.split("-")[0];
                s_city=pararea.split("-")[1];
                s_county=pararea.split("-")[2];
            }
        } else {
            this.entity = new JxPartner();
            s_province="省份";
            s_city="地级市";
            s_county="市、县级市";
        }
        if(user==null){
            user=super.getUser(); 
        }
        return entity;
    }

    @Override
    public String list() throws Exception {
    	String username = user.getUsername();
    	System.out.println(username);
    	if(username.equals("admin")){
    		System.out.println("1");
    		String lever = null;
            String userid = user.getUsername();
        	if(StringUtils.isBlank(parName) && parId == null){
        		page = partnerService.queryProvince(page,userid);
        	}else{
        		if(!"admin".equals(userid)){
        			lever = partnerService.queryLever(userid);
        		}
        		page = partnerService.dimQueryProvince(page,parName,parId,userid,lever);
        	}
            return SUCCESS;
    	}else{
    		String lever = null;
            String userid = user.getUsername();
        	if(StringUtils.isBlank(parName) && parId == null){
        		page = partnerService.queryProvince(page,userid);
        	}else{
        		if(!"admin".equals(userid)){
        			lever = partnerService.queryLever(userid);
        		}
        		page = partnerService.dimQueryProvince(page,parName,parId,userid,lever);
        	}
            return SUCCESS;
    	}
    	
    }
    
    
    public String select() throws Exception{
    	page = partnerService.querySubordinate(page,entity.getId());
    	return SUCCESS;
    }
    public String selectresourcer() throws Exception {
    	String par_level = Struts2Utils.getRequest().getParameter("par_level");
    	this.par_level = par_level;
    	Integer i = Integer.parseInt(par_level);
    	Integer v = i-1;
    	String par_levels = v.toString();
    	if(!StringUtils.isNoneBlank(par_names) && parId== null){
	    	pageResourcer = partnerService.querySelectResourcer(pageResourcer,par_levels);
    	}else{
    		pageResourcer = partnerService.dimQuery(pageResourcer, par_levels, par_names,parId);
    	}
        return "selectcustom";
    }


    @Override
    public String input() throws Exception {
        return INPUT;
    }
    
    @Override
    public String save() throws Exception {
        String str = s_province+"-"+s_city+"-"+s_county;;
        par_level = entity.getPAR_LEVEL();
        String s2 = entity.getPAR_OTHER();
        System.out.println(s2);
        entity.setPAR_AREA(str);
        String phone = entity.getPAR_PHONE();
        //生成产品经理编号
        if(id==null){
        	System.out.println("级别:"+par_level);
        	String bm = s2.substring(1,s2.length());
        	//得到城市编码
        	String code = areaCodeService.findAreaCode(s_city);
        	System.out.println("城市编码:"+ code);
    		String citycode = null;
    		String citycode1 = null;
    		if(code.length() == 4){
    			citycode = code.substring(1, 4);
    			System.out.println(citycode);
    		}else{
    			citycode = code;
    		}
    		//根据级别和城市查询有多少加盟人
    		List<Map<String,Object>> list = areaCodeService.findACode(par_level,s_city,parParentid);
    		String s = list.size()+1+"";
    		if(par_level.equals("-1")){
    			if(list.size()<10 && list.size()<100){
        			citycode1 = "A"+citycode+"0"+s;
        			System.out.println(citycode1);
        		}else{
        			citycode1 ="A"+citycode+s;
        		}
    		}else if(par_level.equals("-2")){
    			if(list.size()<10 && list.size()<100){
    				System.out.println("s2"+s2);
    				
    				citycode1 = "B"+s2 + "0"+s;
    			}else{
    				citycode1 = "B"+s2 +s;
    			}
    		}else if(par_level.equals("-3")){
    			if(list.size()<100 && list.size()<1000){
    				citycode1 = "C"+s2 + "00"+s;
    			}else{
    				citycode1 = "C"+s2 +s;
    			}
    		}else{
    			
    		}
    		
    		entity.setPAR_OTHER(citycode1);
    		entity.setId(Long.valueOf(code+phone));
        }
    
    	partnerService.save(entity);
    	if (this.id == null){
    	    createUser(entity);
    	}
        return SUCCESS;
    }
    
 
    
    private void createUser(JxPartner partner) throws Exception
    {
        User user = new User();
        user.setUsername(partner.getPAR_OTHER());
        user.setRealName(partner.getPAR_NAME());
        user.setPassword("123456");
        user.setPhone(partner.getPAR_PHONE());
        user.setEmail(partner.getId()+"@email.com");
        user.setEnabled(true);
        user.setAccountExpired(false);
        user.setAccountLocked(false);
        user.setCredentialsExpired(false);
        Domain domain = domainManager.getDomain(1l);
        user.setDomain(domain); 
        List<Role> rolelist = accountManager.getAllRole();
        List<Role> useRoles = new ArrayList<Role>();
        for(Role role : rolelist){
            if(role.getName().equals("合伙人")){
                useRoles.add(role);
            }
        }
        user.setUseRoles(useRoles);
        accountManager.saveAndUpdateChild(user);
    }

    @Override
    public String delete() throws Exception {
    	if(id!=null){
    		partnerService.remove(id);
    	}
    	return RELOAD;
    }
    
    public String delAll() throws Exception {
        return RELOAD;
    }

    @Override
    protected void prepareModel() throws Exception {
        
    }

    public JxPartner getEntity() {
        return entity;
    }

    public void setEntity(JxPartner entity) {
        this.entity = entity;
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

    public Page<JxPartner> getPage() {
        return page;
    }

    public void setPage(Page<JxPartner> page) {
        this.page = page;
    }

	public Page<JxPartner> getPageResourcer() {
		return pageResourcer;
	}

	public void setPageResourcer(Page<JxPartner> pageResourcer) {
		this.pageResourcer = pageResourcer;
	}
	 public String getS_province() {
		return s_province;
	}

	public void setS_province(String s_province) {
		this.s_province = s_province;
	}

	public String getS_city() {
		return s_city;
	}

	public void setS_city(String s_city) {
		this.s_city = s_city;
	}

	public String getS_county() {
		return s_county;
	}

	public void setS_county(String s_county) {
		this.s_county = s_county;
	}

	public String getPar_level() {
		return par_level;
	}

	public void setPar_level(String par_level) {
		this.par_level = par_level;
	}

	public String getPar_names() {
		return par_names;
	}

	public void setPar_names(String par_names) {
		this.par_names = par_names;
	}

	public String getParName() {
		return parName;
	}

	public void setParName(String parName) {
		this.parName = parName;
	}

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

	public Long getParId() {
		return parId;
	}

	public void setParId(Long parId) {
		this.parId = parId;
	}
	
	//根据产品经理编号查询订单
		public String selects() throws Exception {
			List<Map<String, List<Map<String, Object>>>> list = this.partnerService
					.querySubordinateNo(Long.valueOf(entity.getId()));
			return SUCCESS;
		}

		public AreaCode getAreaCode() {
			return areaCode;
		}

		public void setAreaCode(AreaCode areaCode) {
			this.areaCode = areaCode;
		}

		public String getParParentid() {
			return parParentid;
		}

		public void setParParentid(String parParentid) {
			this.parParentid = parParentid;
		}
	
	
	
}
