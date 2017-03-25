package com.zombie.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "player")
public class Player {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int playerid;

	public String name = null;
	String species = null;
	int points = 0;
	double locationx = 0;
	double locationy = 0;
	long createts = 0;
	
	String userName=null;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getPlayerid() {
		return playerid;
	}

	public void setPlayerid(int id) {
		this.playerid = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}

	public double getLocationx() {
		return locationx;
	}

	public void setLocationx(double locationx) {
		this.locationx = locationx;
	}

	public double getLocationy() {
		return locationy;
	}

	public void setLocationy(double locationy) {
		this.locationy = locationy;
	}

	public long getCreatets() {
		return createts;
	}

	public void setCreatets(long createts) {
		this.createts = createts;
	}

}