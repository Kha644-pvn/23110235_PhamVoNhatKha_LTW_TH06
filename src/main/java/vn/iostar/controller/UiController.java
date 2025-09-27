package vn.iostar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import vn.iostar.service.ProductService;

@Controller
public class UiController {

    private final ProductService productService;

    public UiController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/ui/product") // ✅ URL trùng với file product.jsp
    public String productsView(Model model) {
        // ✅ Lấy danh sách sản phẩm từ service
        model.addAttribute("products", productService.findAll());
        return "product"; // ✅ Trả về đúng tên file JSP
    }
}
