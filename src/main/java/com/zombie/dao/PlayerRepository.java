package com.zombie.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zombie.entities.Player;

public interface PlayerRepository extends JpaRepository<Player, Integer> {
	Player findByPlayerid(int id);
	Player findBySpecies(String species);
}
