package com.zombie.entities;

import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name="edge")
public class Edge {
	int sourcePlayerId;
	int destPlayerId;
	long createts = 0;
	
	public int getSourcePlayerId(){
		return sourcePlayerId;
	}
	
	public void setSourcePlayerId(int sourcePlayerId){
		this.sourcePlayerId = sourcePlayerId;
	}
	
	public int getDestPlayerId(){
		return sourcePlayerId;
	}
	
	public void setDestPlayerId(int destPlayerId){
		this.destPlayerId = destPlayerId;
	}
	
}
