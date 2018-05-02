package com.game.bmanager.service.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.game.bmanager.entity.JxAdvpic;
import com.game.bmanager.entity.JxAdvpics;
import com.game.bmanager.service.IJxAdvpicService;
import com.game.modules.orm.GenericDao;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.orm.hibernate.GenericDaoHibernate;
import com.game.modules.service.impl.GenericManagerImpl;

@Service("advpicService")
public class JxAdvpicServiceImpl extends GenericManagerImpl<JxAdvpic,Long>implements IJxAdvpicService{
	private GenericDao<JxAdvpic, Long> advpicDao;
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public JxAdvpicServiceImpl(SessionFactory sessionFactory,DataSource dataSource) {
        this.advpicDao = new GenericDaoHibernate<JxAdvpic,Long>(JxAdvpic.class,sessionFactory);
        this.dao = this.advpicDao;
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    @Override
    public List<Map<String, Object>> queryAdverByType(String type) {
        String sql = "select * from jx_advpic where video_type = 0 and adv_invildtime >= NOW() and adv_type = " + type;
        return jdbcTemplate.queryForList(sql);
    }
	@Override
	public Map<String, Object> queryAdverByTypes(String v_id) {
		String sql = "select * from jx_advpic where adv_invildtime >= NOW() and id = '"+v_id+"'";
		return jdbcTemplate.queryForMap(sql);
	}
	@Override
	public Page<JxAdvpic> querySelectResourcer(Page<JxAdvpic> pageResourcer,String adv_type) {
		pageResourcer = advpicDao.findPageOnSql(pageResourcer, "select id,adv_phone,adv_imgurl,adv_dir,adv_name,adv_type,adv_vaildtime,adv_invildtime,adv_addtime,adv_modtime,adv_other,adv_url,video_url,video_dir,sup_id,is_accord,video_type from jx_advpic where adv_type =?", adv_type);
		//pageResourcer = advpicDao.findPageOnSql(pageResourcer, "select id,adv_imgurl,adv_dir,adv_type,adv_url,video_url,video_dir,sup_id,is_accord from jx_advpic where adv_type = -1");
		return pageResourcer;
	}

	/*@Override
	public Page<JxAdvpics> searchPages(Page<JxAdvpics> pages,
			List<PropertyFilter> filters, String sup_id) {
		String sql = "select A.id,A.adv_phone,A.adv_imgurl,A.adv_dir,A.adv_name,A.adv_type,A.adv_vaildtime,A.adv_invildtime,A.adv_addtime,A.adv_url,A.adv_other,A.video_url,A.video_dir,A.sup_id,A.is_accord,A.video_type,t.menu_name from jx_advpic A,jx_menu t where sup_id = '"+sup_id+"'";
		pages = advpicDao.findPageOnSql(pages,sql);
		return pages;
	}*/

}
