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
	private int playerid;

	public String name = null;
	String species = null;
	int points = 0;
	double locationx = 0;
	double locationy = 0;
	long createts = 0;

	public int get_Id() {
		return playerid;
	}

	public void set_Id(int id) {
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