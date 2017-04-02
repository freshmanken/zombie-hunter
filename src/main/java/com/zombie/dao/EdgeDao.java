package com.zombie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zombie.entities.Edge;
import com.zombie.repository.EdgeRepository;

@Repository
public class EdgeDao {

	@Autowired
	private EdgeRepository EdgeRepository;

	/** Gets all the edges. */
	public List<Edge> getAllEdges() {
		return EdgeRepository.findAll();
	}
	/** Gets edge by id. */
	public Edge findBySourceplayeridAndDestplayerid(int sourceplayerid, int destplayerid){
		return EdgeRepository.findBySourceplayeridAndDestplayerid(sourceplayerid, destplayerid);
	}
	
	/** Gets edge by id. */
	public Edge[] findBySourceplayerid(int sourceplayerid){
		return EdgeRepository.findBySourceplayerid(sourceplayerid);
	}
	
	/** add edge. */
	public Edge addEdge(Edge edge){
		return EdgeRepository.save(edge);
	}
	
	/** delete edge. */
	public void deleteEdge(Edge edge){
		EdgeRepository.delete(edge);
	}
}