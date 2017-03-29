package com.zombie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zombie.entities.Player;
import com.zombie.repository.PlayerRepository;

@Repository
public class PlayerDao {

	@Autowired
	private PlayerRepository playerRepository;

	/** Gets all the players. */
	public List<Player> getAllPlayers() {
		return playerRepository.findAll();
	}
	/** Gets player by id. */
	public Player findByPlayerid(int id){
		return playerRepository.findByPlayerid(id);
	}
	/** Gets players by species. */
	public List<Player> findBySpecies(String species){
		return playerRepository.findBySpecies(species);
	}
	/** Gets players by user created */
	public List<Player> findByUserName(String username){
		return playerRepository.findByUserName(username);
	}
	/** add player. */
	public Player addPlayer(Player player){
		return playerRepository.save(player);
	}
}