package com.ljh.model;

public class Garbage {
	
	private Integer id;
	private String name;
	private String type;
	private String category;
	private String remark;

	public Garbage() {

	}

	public Garbage(Integer id, String name, String type, String category, String remark) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.category = category;
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "GarbageType [id=" + id + ", name=" + name + ", type=" + type + ", category=" + category + ", remark="
				+ remark + ", num=" + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}