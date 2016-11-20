package main.java.com.zombie.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
/**
 * @author Jian Luan
 */
@Controller
public class ZombieController {
 
	@RequestMapping("/welcome")
	public ModelAndView helloWorld() {
		String message = "Welcome Zombies and Humans";
		return new ModelAndView("welcome", "message", message);
	}
}