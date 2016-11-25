package com.zombie.controller;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zombie.dao.PlayerDao;
import com.zombie.entities.Player;

/**
 * @author Jian Luan
 */
@Controller
@RequestMapping("/player")
public class PlayerController {
 
	@Autowired
	private PlayerDao playerDao;

	@RequestMapping("/home")
	public ModelAndView playersHome() {
		List<Player> players = playerDao.getAllPlayers();
		ModelAndView model = new ModelAndView("home");
		model.addObject("players", players);
		return model;
	}
}