package com.skilldistillery.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.entities.Item;
import com.skilldistillery.services.ItemService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*","http://localhost:4202"})
public class ItemController {

	@Autowired
	private ItemService itemServ;
	
	@GetMapping("item")
	public List<Item> index(Principal principal, HttpServletResponse res){
		return itemServ.index();
		//principal.getName()
		
		
	}
	
}
