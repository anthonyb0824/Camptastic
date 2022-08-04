package com.skilldistillery.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.entities.Item;

public interface ItemRepository extends JpaRepository<Item, Integer> {

}
