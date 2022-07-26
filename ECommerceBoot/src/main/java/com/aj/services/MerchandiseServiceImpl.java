package com.aj.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.repositories.MerchandiseRepo;
import com.skilldistillery.entities.Merchandise;

@Service
public class MerchandiseServiceImpl implements MerchandiseService {
	
	@Autowired
	private MerchandiseRepo merchRepo;

	@Override
	public List<Merchandise> index() {
		return merchRepo.findAll();
	}

}
