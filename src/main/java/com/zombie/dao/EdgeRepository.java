package com.zombie.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.zombie.entities.Edge;

public interface EdgeRepository extends JpaRepository<Edge, Integer> {
	Edge findBySourceplayeridAndDestplayerid(int sourceplayerid, int destplayerid);
}
