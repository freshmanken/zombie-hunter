package com.zombie.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.zombie.dao.EdgeDao;
import com.zombie.entities.Edge;

/**
 * @author Jian Luan
 */
@RestController
@RequestMapping("/edges")
public class EdgeController {
	
	@Autowired
	private EdgeDao edgeDao;
	
	@RequestMapping(value="/saveEdge", method=RequestMethod.GET)
	public void saveEdge(int sourceplayerid, int destplayerid1, int destplayerid2, int destplayerid3){
		Edge edge1 = new Edge();
		Edge edge2 = new Edge();
		Edge edge3 = new Edge();

		edge1.setDestPlayerId(destplayerid1);
		edge1.setSourcePlayerId(sourceplayerid);
		edge2.setDestPlayerId(destplayerid2);
		edge2.setSourcePlayerId(sourceplayerid);
		edge3.setDestPlayerId(destplayerid3);
		edge3.setSourcePlayerId(sourceplayerid);


		edgeDao.addEdge(edge1);
		edgeDao.addEdge(edge2);
		edgeDao.addEdge(edge3);

	}
	
}