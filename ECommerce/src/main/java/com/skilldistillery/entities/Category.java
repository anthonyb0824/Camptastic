package com.skilldistillery.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name ="category_name")
	private String name;
	
	@ManyToMany
	@JoinTable(name="item_has_category", joinColumns = @JoinColumn(name="category_id"),
	inverseJoinColumns = @JoinColumn(name="item_id"))
	
	private List<Item> items;

}
