package com.zombie.entities;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="edge")
public class Edge {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int EdgeId;
	
	int sourceplayerid;
	int destplayerid;
	Timestamp createts ;
	
	public Timestamp getCreatets() {
		return createts;
	}

	public void setCreatets(Timestamp createts) {
		this.createts = createts;
	}

	public int getSourcePlayerId(){
		return sourceplayerid;
	}
	
	public void setSourcePlayerId(int sourcePlayerId){
		this.sourceplayerid = sourcePlayerId;
	}
	
	public int getDestPlayerId(){
		return sourceplayerid;
	}
	
	public void setDestPlayerId(int destPlayerId){
		this.destplayerid = destPlayerId;
	}
	
}
