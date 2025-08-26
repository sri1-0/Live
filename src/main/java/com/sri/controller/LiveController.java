package com.sri.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
//@RequestMapping("/")
public class LiveController {
@GetMapping("/")
public String hello() {
	return "hello your app is live";
	
}
}
