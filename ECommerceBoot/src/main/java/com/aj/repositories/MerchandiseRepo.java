package com.aj.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aj.entities.Merchandise;

public interface MerchandiseRepo extends JpaRepository<Merchandise, Integer> {

}
