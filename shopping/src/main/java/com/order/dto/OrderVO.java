package com.order.dto;

import java.sql.Timestamp;

public class OrderVO {
	private int order_id;
	private int cart_id;
	private int product_id;
	private String user_id;
	private String receive_name;
	private String receive_phone;
	private Timestamp order_date;
	private String order_addr1;
	private String order_addr2;
	private String order_addr3;
	private int order_quantity;
	private int order_price;
	private String order_memo;
	private String order_pay;
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReceive_name() {
		return receive_name;
	}
	public void setReceive_name(String receive_name) {
		this.receive_name = receive_name;
	}
	public String getReceive_phone() {
		return receive_phone;
	}
	public void setReceive_phone(String receive_phone) {
		this.receive_phone = receive_phone;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public String getOrder_addr1() {
		return order_addr1;
	}
	public void setOrder_addr1(String order_addr1) {
		this.order_addr1 = order_addr1;
	}
	public String getOrder_addr2() {
		return order_addr2;
	}
	public void setOrder_addr2(String order_addr2) {
		this.order_addr2 = order_addr2;
	}
	public String getOrder_addr3() {
		return order_addr3;
	}
	public void setOrder_addr3(String order_addr3) {
		this.order_addr3 = order_addr3;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getOrder_memo() {
		return order_memo;
	}
	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}
	public String getOrder_pay() {
		return order_pay;
	}
	public void setOrder_pay(String order_pay) {
		this.order_pay = order_pay;
	}
	@Override
	public String toString() {
		return "OrderVO [order_id=" + order_id + ", cart_id=" + cart_id + ", product_id=" + product_id + ", user_id="
				+ user_id + ", receive_name=" + receive_name + ", receive_phone=" + receive_phone + ", order_date="
				+ order_date + ", order_addr1=" + order_addr1 + ", order_addr2=" + order_addr2 + ", order_addr3="
				+ order_addr3 + ", order_quantity=" + order_quantity + ", order_price=" + order_price + ", order_memo="
				+ order_memo + ", order_pay=" + order_pay + "]";
	}
	
	
}
