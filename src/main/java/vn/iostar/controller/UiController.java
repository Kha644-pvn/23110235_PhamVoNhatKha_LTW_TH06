package vn.iostar.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UiController {
	 @GetMapping("/ui/product")
	  public String productsView(){ return "product"; }

}
