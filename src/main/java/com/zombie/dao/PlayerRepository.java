package com.zombie.dao;

import java.util.List;

import com.zombie.entities.Player;


public interface PlayerRepository {
	List<Player> findAll();
}
