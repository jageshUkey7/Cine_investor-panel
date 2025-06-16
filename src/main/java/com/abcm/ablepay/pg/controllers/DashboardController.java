package com.abcm.ablepay.pg.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.abcm.ablepay.pg.utils.LoggerUtil;
import jakarta.servlet.http.HttpSession;





@Controller
public class DashboardController {
	
	@GetMapping("/KYC")
	public String kycDetails(Model model,HttpSession session) {

		//		try 
		//		{
		LoggerUtil.LOGGER.info("inside kycDetails ");
		//			 log.info(" loggedInUser  ::"+ session.getAttribute("loggedInUser"));
		//			
		//			  User user = userDetailsServiceImpl.getLoggedUser();
		//              log.info("user :"+user);
		//              model.addAttribute("username", user.getUsername()); 
		//			if (user != null) {
		//				return "dashboard";
		//
		//			}
		//
		//		}
		//		catch(Exception e)
		//		{
		//			e.getMessage();
		//		}
		return "KYC";
	}
	
	@GetMapping("/Userdetails")
	public String Userdetails(Model model,HttpSession session) {

		//		try 
		//		{
		LoggerUtil.LOGGER.info("inside Userdetails");
		//			 log.info(" loggedInUser  ::"+ session.getAttribute("loggedInUser"));
		//			
		//			  User user = userDetailsServiceImpl.getLoggedUser();
		//              log.info("user :"+user);
		//              model.addAttribute("username", user.getUsername()); 
		//			if (user != null) {
		//				return "dashboard";
		//
		//			}
		//
		//		}
		//		catch(Exception e)
		//		{
		//			e.getMessage();
		//		}
		return "Userdetails";
	}

	@GetMapping("/investor")
	public String investor(Model model,HttpSession session) {

		//		try  
		//		{
		LoggerUtil.LOGGER.info("inside investor ");
		//			 log.info(" loggedInUser  ::"+ session.getAttribute("loggedInUser"));
		//			
		//			  User user = userDetailsServiceImpl.getLoggedUser();
		//              log.info("user :"+user);
		//              model.addAttribute("username", user.getUsername()); 
		//			if (user != null) {
		//				return "dashboard";
		//
		//			}
		//
		//		}
		//		catch(Exception e)
		//		{
		//			e.getMessage();
		//		}
		return "investor";
	}


	@GetMapping("/Projects")
	public String Projects(Model model,HttpSession session) {

		//		try  
		//		{
		LoggerUtil.LOGGER.info("inside Projects ");
		//			 log.info(" loggedInUser  ::"+ session.getAttribute("loggedInUser"));
		//			
		//			  User user = userDetailsServiceImpl.getLoggedUser();
		//              log.info("user :"+user);
		//              model.addAttribute("username", user.getUsername()); 
		//			if (user != null) {
		//				return "dashboard";
		//
		//			}
		//
		//		}
		//		catch(Exception e)
		//		{
		//			e.getMessage();
		//		}
		return "Projects";
	}
	
	@GetMapping("/settings")
	public String settings(Model model,HttpSession session) {

		//		try  
		//		{
		LoggerUtil.LOGGER.info("inside settings ");
		//			 log.info(" loggedInUser  ::"+ session.getAttribute("loggedInUser"));
		//			
		//			  User user = userDetailsServiceImpl.getLoggedUser();
		//              log.info("user :"+user);
		//              model.addAttribute("username", user.getUsername()); 
		//			if (user != null) {
		//				return "dashboard";
		//
		//			}
		//
		//		}
		//		catch(Exception e)
		//		{
		//			e.getMessage();
		//		}
		return "settings";
	}
	
	@GetMapping("/contracts")
	public String contract(Model model,HttpSession session) {

		//		try 
		//		{
		LoggerUtil.LOGGER.info("inside kycDetails ");
		//			 log.info(" loggedInUser  ::"+ session.getAttribute("loggedInUser"));
		//			
		//			  User user = userDetailsServiceImpl.getLoggedUser();
		//              log.info("user :"+user);
		//              model.addAttribute("username", user.getUsername()); 
		//			if (user != null) {
		//				return "dashboard";
		//
		//			}
		//
		//		}
		//		catch(Exception e)
		//		{
		//			e.getMessage();
		//		}
		return "contracts";
	}
	@GetMapping("/FAQ")
	public String FAQ(Model model,HttpSession session) {

		//		try 
		//		{
		LoggerUtil.LOGGER.info("inside kycDetails ");
		//			 log.info(" loggedInUser  ::"+ session.getAttribute("loggedInUser"));
		//			
		//			  User user = userDetailsServiceImpl.getLoggedUser();
		//              log.info("user :"+user);
		//              model.addAttribute("username", user.getUsername()); 
		//			if (user != null) {
		//				return "dashboard";
		//
		//			}
		//
		//		}
		//		catch(Exception e)
		//		{
		//			e.getMessage();
		//		}
		return  "FAQ";
	}
	
}
