package com.game.smvc.entity;

import java.io.Serializable;
import java.util.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

import com.game.bmanager.service.IJxPartnerService;

@Table
@Entity(name = "jx_batch")
public class JxBatch implements Serializable {
	
	/**
     * 
     */
    private static final long serialVersionUID = 6635308240132359428L;
    private List<JxOrderItem> jxOrderItem;
    private Long id;
    private Long ord_id;
    private String fim_ord_no;
	private String ord_no;
	private Long u_id;
	private int pro_id;
	private String adr_id;
	private String ord_color;
	private Integer ord_protypeid;
	private String ord_imgurl;
	private String pro_no;
	private Float ord_price;
	private Float ord_priceper;//水机单价
	private String ord_managerno;
	private String ord_sertime;
	private String ord_receivename;
	private Integer ord_ordertype;
	/**
	 * 支付状态：0=成功，1=等待，2=取消
	 */
	private Integer ord_status;
	/**
	 * 下订单时间
	 */
	private Date ord_addtime;
	/** 修改时间 */
	private Date ord_modtime;
	private String ord_phone;
	private Integer ord_way;
	private String ord_proname;
	
	private String pro_restflow;
	private Float Pro_restflow;
	private int pro_day;
	private int ord_pledge;
	private int ord_multiple;
	private int trade_state;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getOrd_id() {
		return ord_id;
	}

	public void setOrd_id(Long ord_id) {
		this.ord_id = ord_id;
	}

	public String getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(String ord_no) {
		this.ord_no = ord_no;
	}

	public Long getU_id() {
		return u_id;
	}

	public void setU_id(Long u_id) {
		this.u_id = u_id;
	}
	public String getOrd_color() {
		return ord_color;
	}

	public void setOrd_color(String ord_color) {
		this.ord_color = ord_color;
	}





	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	public java.lang.String getPro_no() {
		return pro_no;
	}

	public void setPro_no(java.lang.String pro_no) {
		this.pro_no = pro_no;
	}

	public Float getOrd_price() {
		return ord_price;
	}

	public void setOrd_price(Float ord_price) {
		this.ord_price = ord_price;
	}

	public String getOrd_managerno() {
		return ord_managerno;
	}

	public void setOrd_managerno(java.lang.String ord_managerno) {
		this.ord_managerno = ord_managerno;
	}

	public String getOrd_sertime() {
		return ord_sertime;
	}

	public void setOrd_sertime(String ord_sertime) {
		this.ord_sertime = ord_sertime;
	}

	public Integer getOrd_status() {
		return ord_status;
	}

	public void setOrd_status(Integer ord_status) {
		this.ord_status = ord_status;
	}

	public java.util.Date getOrd_addtime() {
		return ord_addtime;
	}

	public void setOrd_addtime(java.util.Date ord_addtime) {
		this.ord_addtime = ord_addtime;
	}

	public java.util.Date getOrd_modtime() {
		return ord_modtime;
	}

	public void setOrd_modtime(java.util.Date ord_modtime) {
		this.ord_modtime = ord_modtime;
	}


	public String getAdr_id() {
		return adr_id;
	}

	public void setAdr_id(String adr_id) {
		this.adr_id = adr_id;
	}

	public String getOrd_imgurl() {
		return ord_imgurl;
	}

	public void setOrd_imgurl(String ord_imgurl) {
		this.ord_imgurl = ord_imgurl;
	}

	public Integer getOrd_protypeid() {
        return ord_protypeid;
    }

    public void setOrd_protypeid(Integer ord_protypeid) {
        this.ord_protypeid = ord_protypeid;
    }

	public String getOrd_phone() {
		return ord_phone;
	}

	public void setOrd_phone(String ord_phone) {
		this.ord_phone = ord_phone;
	}


	public Integer getOrd_way() {
		return ord_way;
	}

	public void setOrd_way(Integer ord_way) {
		this.ord_way = ord_way;
	}

	public String getOrd_receivename() {
		return ord_receivename;
	}

	public void setOrd_receivename(String ord_receivename) {
		this.ord_receivename = ord_receivename;
	}

	public Integer getOrd_ordertype() {
		return ord_ordertype;
	}

	public void setOrd_ordertype(Integer ord_ordertype) {
		this.ord_ordertype = ord_ordertype;
	}

	public String getOrd_proname() {
		return ord_proname;
	}

	public void setOrd_proname(String ord_proname) {
		this.ord_proname = ord_proname;
	}

	public String getPro_restflow() {
		return pro_restflow;
	}

	public void setPro_restflow(String pro_restflow) {
		this.pro_restflow = pro_restflow;
	}

	public int getPro_day() {
		return pro_day;
	}

	public void setPro_day(int pro_day) {
		this.pro_day = pro_day;
	}

	
	public void setPro_restflow(Float pro_restflow) {
		this.Pro_restflow = pro_restflow;
	}

	public String getFim_ord_no() {
		return fim_ord_no;
	}

	public void setFim_ord_no(String fim_ord_no) {
		this.fim_ord_no = fim_ord_no;
	}

	public int getOrd_pledge() {
		return ord_pledge;
	}

	public void setOrd_pledge(int ord_pledge) {
		this.ord_pledge = ord_pledge;
	}

	public int getOrd_multiple() {
		return ord_multiple;
	}

	public void setOrd_multiple(int ord_multiple) {
		this.ord_multiple = ord_multiple;
	}

	public Float getOrd_priceper() {
		return ord_priceper;
	}

	public void setOrd_priceper(Float ord_priceper) {
		this.ord_priceper = ord_priceper;
	}

	public int getTrade_state() {
		return trade_state;
	}

	public void setTrade_state(int trade_state) {
		this.trade_state = trade_state;
	}

	

	

}