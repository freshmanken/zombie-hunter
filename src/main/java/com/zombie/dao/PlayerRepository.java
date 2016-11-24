package main.java.com.zombie.dao;

import java.util.*;

import main.java.com.zombie.entities.Player;

public interface PlayerRepository {
	List<Player> findAll();
}
