package com.game.smvc.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 优惠价格表
 * @author liuhu
 *
 */
@Table
@Entity(name = "jx_sale")
public class JxSale {

	public int id;
	public int prot_type;
	public int sale_status;
	public float sale_price;
	private Date creat_time;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProt_type() {
		return prot_type;
	}
	public void setProt_type(int prot_type) {
		this.prot_type = prot_type;
	}
	public int getSale_status() {
		return sale_status;
	}
	public void setSale_status(int sale_status) {
		this.sale_status = sale_status;
	}
	public float getSale_price() {
		return sale_price;
	}
	public void setSale_price(float sale_price) {
		this.sale_price = sale_price;
	}
	public Date getCreat_time() {
		return creat_time;
	}
	public void setCreat_time(Date creat_time) {
		this.creat_time = creat_time;
	}
	@Override
	public String toString() {
		return "JxSale [id=" + id + ", prot_type=" + prot_type
				+ ", sale_status=" + sale_status + ", sale_price=" + sale_price
				+ ", creat_time=" + creat_time + "]";
	}
	public JxSale(int id, int prot_type, int sale_status, float sale_price,
			Date creat_time) {
		super();
		this.id = id;
		this.prot_type = prot_type;
		this.sale_status = sale_status;
		this.sale_price = sale_price;
		this.creat_time = creat_time;
	}
	
	public JxSale() {
		super();
	}
	
	
}
