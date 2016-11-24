package main.java.com.zombie.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;

import main.java.com.zombie.entities.Player;

public class PlayerDao {
     private static final String PERSISTENCE_UNIT_NAME = "Player";
     private static EntityManagerFactory factory;
     
     @Autowired
     private PlayerRepository playerRepository;

     public static void main(String[] args) {
          factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
          EntityManager em = factory.createEntityManager();
          // Read the existing entries and write to console
          Query q = em.createQuery("SELECT u FROM User u");
          List<Player> playerList = q.getResultList();
          for (Player player : playerList) {
               System.out.println(player.name);
          }
          System.out.println("Size: " + playerList.size());

          // Create new player
          em.getTransaction().begin();
          Player player = new Player();
          player.set_Id(3);
          player.setName("Tom Johnson");
          player.setSpecies("human");
          player.setPoints(1);
          player.setLocationx(1.1);
          player.setLocationy(2.2);
          em.persist(player);
          em.getTransaction().commit();

          em.close();
     }
}