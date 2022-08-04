package com.aj.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.repositories.ItemRepo;
import com.skilldistillery.entities.Item;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private ItemRepo merchRepo;

	@Override
	public List<Item> index() {
		return merchRepo.findAll();
	}

}
