package com.aj.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.entities.Merchandise;

public interface MerchandiseRepo extends JpaRepository<Merchandise, Integer> {

}
