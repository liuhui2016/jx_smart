package com.game.smvc.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity(name = "jx_appraise")
public class JxAppraise implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private int u_id;
	private int after_id;//售后id
	private String pro_no;
	private String ord_no;
	private String service_type;//服务类型
	private String service_master;//服务师傅
	private String service_master_phone;//服务师傅联系方式
	private String evaluation_people;//评价人
	private String evaluation_people_phone;//评价人联系方式
	private String ae_content;//评价内容
	private String appraise_url;//图片
	private String is_badge;//是否戴工牌
	private String is_overalls;//是否穿工作服
	private String is_anonymous;//是否匿名
	private String ae_satisfaction;//满意度
	private String service_attitude;//服务态度
	private String ord_managerno;//所属合伙人编号
	private Date ae_addtime;
	private Date ae_modtime;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getPro_no() {
		return pro_no;
	}
	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}
	public String getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(String ord_no) {
		this.ord_no = ord_no;
	}
	public String getService_type() {
		return service_type;
	}
	public void setService_type(String service_type) {
		this.service_type = service_type;
	}
	public String getService_master() {
		return service_master;
	}
	public void setService_master(String service_master) {
		this.service_master = service_master;
	}
	public String getAe_content() {
		return ae_content;
	}
	public void setAe_content(String ae_content) {
		this.ae_content = ae_content;
	}
	public String getAppraise_url() {
		return appraise_url;
	}
	public void setAppraise_url(String appraise_url) {
		this.appraise_url = appraise_url;
	}
	public String getIs_badge() {
		return is_badge;
	}
	public void setIs_badge(String is_badge) {
		this.is_badge = is_badge;
	}
	public String getIs_overalls() {
		return is_overalls;
	}
	public void setIs_overalls(String is_overalls) {
		this.is_overalls = is_overalls;
	}
	public String getIs_anonymous() {
		return is_anonymous;
	}
	public void setIs_anonymous(String is_anonymous) {
		this.is_anonymous = is_anonymous;
	}
	public String getAe_satisfaction() {
		return ae_satisfaction;
	}
	public void setAe_satisfaction(String ae_satisfaction) {
		this.ae_satisfaction = ae_satisfaction;
	}
	public String getService_attitude() {
		return service_attitude;
	}
	public void setService_attitude(String service_attitude) {
		this.service_attitude = service_attitude;
	}
	public String getOrd_managerno() {
		return ord_managerno;
	}
	public void setOrd_managerno(String ord_managerno) {
		this.ord_managerno = ord_managerno;
	}
	public Date getAe_addtime() {
		return ae_addtime;
	}
	public void setAe_addtime(Date ae_addtime) {
		this.ae_addtime = ae_addtime;
	}
	public Date getAe_modtime() {
		return ae_modtime;
	}
	public void setAe_modtime(Date ae_modtime) {
		this.ae_modtime = ae_modtime;
	}
	public int getAfter_id() {
		return after_id;
	}
	public void setAfter_id(int after_id) {
		this.after_id = after_id;
	}
	public String getEvaluation_people_phone() {
		return evaluation_people_phone;
	}
	public void setEvaluation_people_phone(String evaluation_people_phone) {
		this.evaluation_people_phone = evaluation_people_phone;
	}
	public String getEvaluation_people() {
		return evaluation_people;
	}
	public void setEvaluation_people(String evaluation_people) {
		this.evaluation_people = evaluation_people;
	}
	public String getService_master_phone() {
		return service_master_phone;
	}
	public void setService_master_phone(String service_master_phone) {
		this.service_master_phone = service_master_phone;
	}
}
