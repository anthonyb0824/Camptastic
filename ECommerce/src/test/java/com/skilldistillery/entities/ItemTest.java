package com.skilldistillery.entities;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ItemTest {
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Item merch;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("ECommerce");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		merch = em.find(Item.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		merch = null;
	}

	@Test
	void test() {
		assertNotNull(merch);
		assertEquals(merch.getName(),"boots");
	}
	
	@Test
	void test1() {
		assertNotNull(merch);
		assertEquals(merch.getPrice(), 49.99);
	}
	@Test
	void test2() {
		assertNotNull(merch);
		assertTrue(merch.getCategories().size()<1);
		
	}

}
