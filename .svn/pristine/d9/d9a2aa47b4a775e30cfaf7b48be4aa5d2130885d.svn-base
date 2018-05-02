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
import com.game.bmanager.service.IJxVideoService;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.orm.hibernate.HibernateUtils;
import com.game.modules.web.CrudActionSupport;
import com.game.modules.web.struts2.Struts2Utils;
import com.game.util.Constants;
import com.game.util.Md5Encoder;


@Namespace("/bmanager/advpic")
@Results({ @Result(name = "reload", location = "advpic.action?authId=${authId}", type = "redirect") })
public class AdvpicAction extends CrudActionSupport<JxAdvpic>{ 

	/**
	 * 
	 */
	private static final long serialVersionUID = -7851191912689823824L;
	
	@Autowired
	private IJxAdvpicService advpicService;
	
	private JxAdvpic advpic;
	
	private File iconfile;
	
	private File iconfiles;
	    
	private String iconfileFileName;
	
	private int is_accord;
	private String sup_id;
	
	private Long id;
	private Long oldId;
	private List<Long> ids;
	private Page<JxAdvpic> page = new Page<JxAdvpic>(15);
	
	private Page<JxAdvpic> pageResourcer = new Page<JxAdvpic>(10);

	@Override
	public JxAdvpic getModel() {
		if (this.id != null) {
			this.advpic = ((JxAdvpic) advpicService.get(this.id));
		} else {
			this.advpic = new JxAdvpic();
		}
		
		/*if (this.vid != null) {
			this.jxvideo = ((JxVideo) videoService.get(this.vid));
		} else {
			this.jxvideo = new JxVideo();
		}*/
		
		return advpic;
	}

	@Override
	public String delete() throws Exception {
		if(id != null){
			advpicService.remove(id);
		}
		return RELOAD;
	}

	@Override
	public String input() throws Exception {
		return INPUT;
	}

	@Override
	public String list() throws Exception {
		List<PropertyFilter> filters = HibernateUtils
				.buildPropertyFilters(Struts2Utils.getRequest());
		if (!this.page.isOrderBySetted()) {
			this.page.setOrderBy("id");
			this.page.setOrder("desc");
		}
		page = advpicService.searchPage(page, filters);
		return SUCCESS;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		
	}
	
	 public String selectresourcer() throws Exception {
		 String adv_type = Struts2Utils.getRequest().getParameter("adv_type");
		 List<PropertyFilter> filters = HibernateUtils
					.buildPropertyFilters(Struts2Utils.getRequest());
		
		if (!this.pageResourcer.isOrderBySetted()) {
			this.pageResourcer.setOrderBy(adv_type);
			this.page.setOrder("asc");
		}
		pageResourcer = advpicService.searchPage(pageResourcer, filters);
		//pageResourcer = advpicService.querySelectResourcer(pageResourcer,adv_type);
	    return "selectcustom";
	 }

	
	@Override
	public String save() throws Exception {
		boolean flag = false;
		if (advpic.getId() == null) {
			flag = true;
			advpic.setAdv_addtime(new Date());
		}
		advpic.setAdv_modtime(new Date());
		
		String advType = advpic.getAdv_type()+"";
		int VideoType = advpic.getVideo_type();//1位视频  0为图片
		//判断类型
		if("-1".equals(advType)){
			//平板上传  判断上传类型
			if(VideoType == 1){
				//平板上传视频&图片
				/*boolean flag1 = false;
				if (jxvideo.getId() == null) {
					flag1 = true;
					jxvideo.setAdv_addtime(new Date());
				}
				jxvideo.setAdv_modtime(new Date());*/
				
				if (iconfile != null) {
					String iconPath = Constants.CONS_PROPERTIES.getValue("PIC_PATH");
					String iconUrl = Constants.CONS_PROPERTIES.getValue("PIC_URL");
					String iconMd5 = Md5Encoder.md5(iconfile);
					String newFileName = iconMd5
							+ iconfileFileName.substring(iconfileFileName
									.lastIndexOf("."));
					// 保存路径
					File targeta = new File(iconPath + File.separator, newFileName);
					FileUtils.copyFile(iconfile, targeta);

					advpic.setAdv_imgurl(iconUrl + "/" + newFileName);// 下载路径
					advpic.setAdv_dir(targeta.getPath());
					
					if(iconfiles != null){
						String iconPath1 = Constants.CONS_PROPERTIES.getValue("PIC_PATH");
						String iconUrl1 = Constants.CONS_PROPERTIES.getValue("PIC_URL");
						String iconMd51 = Md5Encoder.md5(iconfiles);
						String newFileName1 = iconMd51+ ".mp4";
						// 保存路径
						File targeta1 = new File(iconPath1 + File.separator, newFileName1);
						FileUtils.copyFile(iconfiles, targeta1);
						advpic.setVideo_dir(targeta1.getPath());
						advpic.setVideo_url(iconUrl1 + "/" + newFileName1);
					} else {
						System.out.println("pic is null");
					}
					
					if (flag) {
						this.logToDB(106, "新增图片ID：" + advpic.getId());
					} else {
						this.logToDB(106, "修改图片ID：" + advpic.getId());
					}
					advpic.setAdv_type(advpic.getAdv_type());
					advpic.setVideo_type(VideoType);
					advpic.setAdv_vaildtime(advpic.getAdv_vaildtime());
					advpic.setAdv_invildtime(advpic.getAdv_invildtime());
					advpic.setAdv_url(advpic.getAdv_url());
					advpic.setSup_id(sup_id);
					advpic.setIs_accord(is_accord);
					advpicService.save(advpic);
				}else{
					//不带logo的视频
					if(iconfiles != null){
						String iconPath1 = Constants.CONS_PROPERTIES.getValue("PIC_PATH");
						String iconUrl1 = Constants.CONS_PROPERTIES.getValue("PIC_URL");
						String iconMd51 = Md5Encoder.md5(iconfiles);
						String newFileName1 = iconMd51+ ".mp4";
						// 保存路径
						File targeta1 = new File(iconPath1 + File.separator, newFileName1);
						FileUtils.copyFile(iconfiles, targeta1);
						advpic.setVideo_dir(targeta1.getPath());
						advpic.setVideo_url(iconUrl1 + "/" + newFileName1);
					} else {
						System.out.println("pic is null");
					}
					
					if (flag) {
						this.logToDB(106, "新增图片ID：" + advpic.getId());
					} else {
						this.logToDB(106, "修改图片ID：" + advpic.getId());
					}
				
					advpic.setAdv_type(advpic.getAdv_type());
					advpic.setVideo_type(VideoType);
					advpic.setAdv_vaildtime(advpic.getAdv_vaildtime());
					advpic.setAdv_invildtime(advpic.getAdv_invildtime());
					advpic.setSup_id(sup_id);
					advpic.setIs_accord(is_accord);
					advpic.setAdv_url(advpic.getAdv_url());
					advpicService.save(advpic);
				}
				
				return RELOAD;
			}else{
				//平板上传图片
				if (iconfile != null) {
					String iconPath = Constants.CONS_PROPERTIES.getValue("PIC_PATH");
					String iconUrl = Constants.CONS_PROPERTIES.getValue("PIC_URL");
					String iconMd5 = Md5Encoder.md5(iconfile);
					String newFileName = iconMd5
							+ iconfileFileName.substring(iconfileFileName
									.lastIndexOf("."));

					// 保存路径
					File targeta = new File(iconPath + File.separator, newFileName);
					FileUtils.copyFile(iconfile, targeta);
					
					advpic.setAdv_imgurl(iconUrl + "/" + newFileName);// 下载路径
					advpic.setAdv_dir(targeta.getPath());
					
				} else {
					System.out.println("pic is null");
				}
				if (flag) {
					this.logToDB(106, "新增图片ID：" + advpic.getId());
				} else {
					this.logToDB(106, "修改图片ID：" + advpic.getId());
				}
				advpic.setIs_accord(is_accord);
				advpicService.save(advpic);
				return RELOAD;
			}
			
		}else{
			//单独上传图片
			if (iconfile != null) {
				String iconPath = Constants.CONS_PROPERTIES.getValue("PIC_PATH");
				String iconUrl = Constants.CONS_PROPERTIES.getValue("PIC_URL");
				String iconMd5 = Md5Encoder.md5(iconfile);
				String newFileName = iconMd5
						+ iconfileFileName.substring(iconfileFileName
								.lastIndexOf("."));

				// 保存路径
				File targeta = new File(iconPath + File.separator, newFileName);
				FileUtils.copyFile(iconfile, targeta);

				advpic.setAdv_imgurl(iconUrl + "/" + newFileName);// 下载路径
				advpic.setAdv_dir(targeta.getPath());
				
			} else {
				System.out.println("pic is null");
			}
			if (flag) {
				this.logToDB(106, "新增图片ID：" + advpic.getId());
			} else {
				this.logToDB(106, "修改图片ID：" + advpic.getId());
			}
			advpic.setIs_accord(0);
			advpic.setVideo_type(0);
			advpicService.save(advpic);
			return RELOAD;
		}
	}
	
	public JxAdvpic getAdvpic() {
		return advpic;
	}

	public void setAdvpic(JxAdvpic advpic) {
		this.advpic = advpic;
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

	public Page<JxAdvpic> getPage() {
		return page;
	}

	public void setPage(Page<JxAdvpic> page) {
		this.page = page;
	}

	public File getIconfile() {
		return iconfile;
	}

	public void setIconfile(File iconfile) {
		this.iconfile = iconfile;
	}

	public String getIconfileFileName() {
		return iconfileFileName;
	}

	public void setIconfileFileName(String iconfileFileName) {
		this.iconfileFileName = iconfileFileName;
	}

	public File getIconfiles() {
		return iconfiles;
	}

	public void setIconfiles(File iconfiles) {
		this.iconfiles = iconfiles;
	}

	public Page<JxAdvpic> getPageResourcer() {
		return pageResourcer;
	}

	public void setPageResourcer(Page<JxAdvpic> pageResourcer) {
		this.pageResourcer = pageResourcer;
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


}
