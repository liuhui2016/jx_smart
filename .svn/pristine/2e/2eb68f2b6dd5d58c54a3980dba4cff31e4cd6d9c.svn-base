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
import com.game.comm.service.IAreaCodeService;
import com.game.entity.account.Domain;
import com.game.entity.account.Role;
import com.game.entity.account.User;
import com.game.modules.orm.Page;
import com.game.modules.web.CrudActionSupport;
import com.game.modules.web.struts2.Struts2Utils;
import com.game.services.account.AccountManager;
import com.game.services.account.DomainManager;
import com.game.smvc.util.RandomUtil;

@Namespace("/bmanager/partner")
@Results({ @Result(name = "reload", location = "partner.action?authId=${authId}", type = "redirect") })
public class PartnerAction extends CrudActionSupport<JxPartner>{

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
    
    private String parParentid;
    
    private String par_other;
   

	private Long id;
    private Long oldId;
    private List<Long> ids;
    private Page<JxPartner> page = new Page<JxPartner>(15);
    
    @Override
    public JxPartner getModel() {
        if (this.id != null) {
            this.entity = ((JxPartner) partnerService.get(this.id));
            System.out.println(this.entity);
            String pararea = entity.getPAR_AREA();
            if(entity.getPAR_LEVEL().equals("1")){
                s_province=pararea;
                s_city="地级市";
                s_county="市、县级市";
            }else if(entity.getPAR_LEVEL().equals("2")){
                s_province=pararea.split("-")[0];
                s_city=pararea.split("-")[1];
                s_county="市、县级市";
            }else if(entity.getPAR_LEVEL().equals("-1") || entity.getPAR_LEVEL().equals("-2") ||entity.getPAR_LEVEL().equals("-3")){
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
    	if(username.equals("ruize")){
    		String lever = null;
            String userid = user.getUsername();
        	if(StringUtils.isBlank(parName) && parId == null){
        		System.out.println("1");
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
        		System.out.println("2");
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
    	//page = partnerService.querySubordinate(page,entity.getId());
    	String username = user.getUsername();
    	if(username.equals("ruize")){
    		//page = partnerService.querySubordinates(page,entity.getId());
    		Long id = entity.getId();
        	String parentid = partnerService.findParentid(id);
    		page = partnerService.querySubordinates(page,parentid);
    	}else{
    		page = partnerService.querySubordinate(page,entity.getId());
    		
    	}
    	return SUCCESS;
    }
    
    public String selectRT() throws Exception{
    	Long id = entity.getId();
    	String parentid = partnerService.findParentid(id);
    	page = partnerService.querySubordinatess(page,parentid,id);
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
    
    public String rtselectresourcer() throws Exception {
    	String par_level = Struts2Utils.getRequest().getParameter("par_level");
    	this.par_level = par_level;
    	Integer i = Integer.parseInt(par_level);
    	Integer v = i+1;
    	String par_levels = v.toString();
    	if(!StringUtils.isNoneBlank(par_names) && parId== null){
	    	pageResourcer = partnerService.querySelectResourcerRT(pageResourcer,par_levels);
    	}else{
    		pageResourcer = partnerService.dimQueryRT(pageResourcer, par_levels, par_names,parId);
    		
    	}
        return "selectcustoms";
    }


    @Override
    public String input() throws Exception {
        return INPUT;
    }
    
    @Override
    public String save() throws Exception {
        String str = null;
        par_level = entity.getPAR_LEVEL();
        if(par_level.equals("1")){
            str = s_province;
        }else if(par_level.equals("2")){
            str = s_province+"-"+s_city;
        }else{
            str = s_province+"-"+s_city+"-"+s_county;
        }
        entity.setPAR_AREA(str);
        if(id==null){
            String citycode = partnerService.findCityCodeByCity(par_level,s_province,s_city,s_county);
            DecimalFormat df = new DecimalFormat("00000");
            String num = df.format(partnerService.countNum());
            entity.setId(Long.valueOf(citycode+num));
        }
        entity.setPar_shop(entity.getPar_shop());
        entity.setPar_pact(entity.getPar_pact());
        entity.setIspermissions(entity.getIspermissions());
    	partnerService.save(entity);
    	if (this.id == null){
    	    createUser(entity);
    	}
        return RELOAD;
    }
    
 
    
    private void createUser(JxPartner partner) throws Exception
    {
        User user = new User();
        user.setUsername(partner.getId().toString());
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
    
    public String rtsave() throws Exception {
    	String str = null;
    	if(s_city.contains("地级市")){
    		str = s_province;
    	}else{
    		if(s_county.contains("市、县级市")){
    			 str = s_province+"-"+s_city;
    		}else{
    			str = s_province+"-"+s_city+"-"+s_county;
    		}
    	}
        par_level = entity.getPAR_LEVEL();
        entity.setPAR_AREA(str);
        //生成产品经理编号
        if(id==null){
        	String city = null;
        	//得到城市编码
        	if(s_province.equals("北京市") || s_province.equals("上海市") || s_province.equals("天津市")){
        		city = s_province;
        	}else{
        		city = s_city;
        	}
        	String code = areaCodeService.findAreaCode(city);
    		String citycode = null;
    		String citycode1 = null;
    		if(code.length() == 4){
    			citycode = code.substring(1, 4);
    		}else{
    			citycode = code;
    		}
    		//根据级别和城市查询有多少加盟人
    		parParentid = entity.getParParentid();
    		List<Map<String,Object>> list = areaCodeService.findACode(par_level,city,parParentid);
    		List<Map<String,Object>> list1 = areaCodeService.findOtherCode(par_level,city,parParentid);
    		int num = 0;
    		if(list1.size()<=0){
    			num = 1;
    		}else{
    			Map<String,Object> map = list1.get(0);
    			String par_other = (String) map.get("par_other");
    			int s3 = Integer.parseInt(par_other.substring(par_other.length()-1));
    			String z = par_other.substring((par_other.length()-2));
    			int s4 = Integer.parseInt(z);
    			if(s4 == 10){
    				num = s3;
    			}else{
    				num = s3 +1;
    			}
    		}
    		String s = list.size()+1+"";
    		if(par_level.equals("-1")){
    			if(list1.size()<10 && list1.size()<100){
        			citycode1 = "A"+citycode+"0"+num;
        			System.out.println(citycode1);
        		}else{
        			citycode1 ="A"+citycode+num;
        		}
    			entity.setParParentid(null);
    			entity.setPAR_PARENT(null);
    		}else if(par_level.equals("-2")){
    			parParentid = entity.getParParentid();
    			entity.setParParentid(parParentid);
    		    String s2 = parParentid.substring(1, parParentid.length());
    			if(list1.size()<10 && list1.size()<100){
    				citycode1 = "B"+s2 + "0"+num;
    			}else{
    				citycode1 = "B"+s2 +num;
    			}
    		}else if(par_level.equals("-3")){
    			parParentid = entity.getParParentid();
    			entity.setParParentid(parParentid);
    		    String s2 = parParentid.substring(1, parParentid.length());
    		    if(parParentid.contains("A")){
    		    	int s4 = 0;
    		    	String z = null;
    		    	if(list1.size() > 0){
    		    		Map<String,Object> map = list1.get(0);
    		    		String par_other = (String) map.get("par_other");
    		    		z = par_other.substring((par_other.length()-2));
    		    		s4 = Integer.parseInt(z);
    		    		int s5 = s4 + 1;
		    			z = String.valueOf(s5);
    		    	}else{
    		    		s4 = 1;
    		    	}
    		    	if(list1.size()<100 && list1.size()<1000){
    		    		if(s4 > 0 && s4 < 10){
    		    			System.out.println("1");
    		    			citycode1 = "C"+s2 +"00" + "00"+num;
    		    		}else{
    		    			System.out.println("2");
    		    			System.out.println("z:"+z);
    		    			citycode1 = "C"+s2 + "000" +z;
    		    			System.out.println("citycode1:"+citycode1);
    		    		}
    		    	}else{
    		    		citycode1 = "C"+s2 + "00" +z;
    		    	}
    		    }else{
    		    	if(list1.size()<100 && list1.size()<1000){
    		    		System.out.println("num:"+num);
    		    		citycode1 = "C"+s2 + "00"+num;
    		    	}else{
    		    		citycode1 = "C"+s2 +num;
    		    	}
    		    }
    		}else{
    			
    		}
    		
    		//List<Map<String,Object>> list1 = areaCodeService.findOther();
    		String a = RandomUtil.getRandomNumbers();
    		String ids = citycode1.substring(1, citycode1.length());
    		ids = ids + a;
    		entity.setPAR_OTHER(citycode1);
    		entity.setId(Long.valueOf(ids));
        }
    
    	partnerService.save(entity);
    	if (this.id == null){
    	    createUsers(entity);
    	}
        return RELOAD;
    }
    
 
    
    private void createUsers(JxPartner partner) throws Exception
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
    		String s = id+"";
    		if(s.length()>11){
    			System.out.println("删除1");
    			String par_other2 = partnerService.findParOther(id);
        		String ids1 = partnerService.findId(par_other2);
        		int delete2 = partnerService.deleteUserRole(ids1);
        		int delete1 = partnerService.deleteAccUser(ids1);
        		partnerService.remove(id);
    		}else{
    			System.out.println("删除2");
        		partnerService.remove(id);
    		}
    		
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
			/*List<Map<String, List<Map<String, Object>>>> list = this.partnerService
					.querySubordinateNo(entity.getId());*/
			
			List<Map<String, List<Map<String, Object>>>> list = this.partnerService
					.querySubordinateNo(Long.valueOf(entity.getId()));
			return SUCCESS;
		}

		public String getParParentid() {
			return parParentid;
		}

		public void setParParentid(String parParentid) {
			this.parParentid = parParentid;
		}

		public String getPar_other() {
			return par_other;
		}

		public void setPar_other(String par_other) {
			this.par_other = par_other;
		}
	
	
	
}
