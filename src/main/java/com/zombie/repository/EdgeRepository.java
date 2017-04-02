package com.zombie.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zombie.entities.Edge;

public interface EdgeRepository extends JpaRepository<Edge, Integer> {
	Edge findBySourceplayeridAndDestplayerid(int sourceplayerid, int destplayerid);

	Edge[] findBySourceplayerid(int sourceplayerid);
}
