package com.zombie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zombie.entities.Player;

@Repository
public class PlayerDao {

	@Autowired
	private PlayerRepository playerRepository;

	/** Gets all the players. */
	public List<Player> getAllPlayers() {
		return playerRepository.findAll();
	}
	public Player findByPlayerid(int id){
		return playerRepository.findByPlayerid(id);
	}
	public Player findBySpecies(String species){
		return playerRepository.findBySpecies(species);
	}
}