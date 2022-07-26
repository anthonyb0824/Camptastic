package com.aj.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aj.services.MerchandiseService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*","http://localhost:4202"})
public class MerchandiseController {

	@Autowired
	MerchandiseService serv;
}
