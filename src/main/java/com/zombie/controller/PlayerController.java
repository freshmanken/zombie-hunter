package com.zombie.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zombie.dao.EdgeDao;
import com.zombie.dao.PlayerDao;
import com.zombie.entities.Edge;
import com.zombie.entities.Player;

/**
 * @author Jian Luan
 */
@Controller
@RequestMapping("/players")
public class PlayerController {

	@Autowired
	private PlayerDao playerDao;
	@Autowired
	private EdgeDao edgeDao;

	@RequestMapping("/home")
	public ModelAndView playersHome() {
		List<Player> players = playerDao.getAllPlayers();
		ModelAndView model = new ModelAndView("home");
		model.addObject("players", players);
		return model;
	}

	/** Returns JSON String */
	@ResponseBody
	@RequestMapping("/get")
	public List<Player> playersHomeRest() {
		List<Player> players = playerDao.getAllPlayers();
		return players;
	}

	@RequestMapping("/addPlayer")
	public String addPlayer(String name, Principal principal) {
		//, String species, int points, double locationx, double locationy was in arguement before

		DecimalFormat df2 = new DecimalFormat(".####");
		User activeUser = (User) ((Authentication) principal).getPrincipal();
		String user = activeUser.getUsername();
		Player player = new Player();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		Random random = new Random();

		double locationx = Double.parseDouble(df2.format(random.nextDouble() * ((-76.98)-(-77.07)) + -77.07));
		double locationy = Double.parseDouble(df2.format(random.nextDouble() * ((38.91)-(38.87)) + 38.87));

		

		String[] species = { "hu", "zo" };
		String specie = species[random.nextInt(species.length)];

		player.setName(name);
		player.setSpecies(specie);
		player.setPoints(0);
		player.setLocationx(locationx);
		player.setLocationy(locationy);
		player.setCreatets(timestamp);
		player.setUserName(user);
		playerDao.addPlayer(player);
		return "redirect:/players/home";
		
//		List<Player> players = playerDao.getAllPlayers();
//		ModelAndView model = new ModelAndView("home");
//		model.addObject("players", players);
//		return model;
	}

	@RequestMapping("/map")
	public String map() {
		return "map";
	}

	@RequestMapping("/selectPlayer")
	public ModelAndView selectPlayer(@RequestParam("username") String username, @RequestParam("step") String step, @RequestParam("species") String species) {
		List<Player> player;

		if (step.equals("1")) {
			player = playerDao.findByUserName(username);
		}
		else {
			if (species.equals("hu")) {
				player = playerDao.findBySpecies("zo");
			} else {
				player = playerDao.findBySpecies("hu");
			}
		}
		ModelAndView model = new ModelAndView("selectPlayer");
		model.addObject("players", player);
		return model;
	}

	@RequestMapping("/saveEdge")
	public String saveEdge(@RequestParam("passId") String passId, @RequestParam("humanIds") String humanIds) {

		Integer sourceplayerid = Integer.parseInt(passId);

		String[] humanIDs = humanIds.split(",");
		

		for (String s : humanIDs) {
			Integer destplayerid = Integer.parseInt(s);
			Edge edge = new Edge();
			edge.setSourcePlayerId(sourceplayerid.intValue());
			edge.setDestPlayerId(destplayerid.intValue());
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			edge.setCreatets(timestamp);
			edgeDao.addEdge(edge);
		}

		return "map";

	}

}