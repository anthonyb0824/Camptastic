package com.aj.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.entities.Item;

public interface ItemRepo extends JpaRepository<Item, Integer> {

}
