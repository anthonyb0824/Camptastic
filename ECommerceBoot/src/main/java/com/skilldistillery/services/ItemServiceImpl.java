package com.skilldistillery.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.entities.Item;
import com.skilldistillery.repositories.ItemRepository;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private ItemRepository merchRepo;




	@Override
	public List<Item> index(String username) {
		// TODO Auto-generated method stub
		return merchRepo.findAll();
	}
	
	
	

}
