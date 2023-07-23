package com.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cart.dto.CartVO;
import com.product.dto.ProductVO;
import com.cart.service.CartService;
import com.order.dto.OrderVO;
import com.order.service.OrderService;
import com.user.dto.UserVO;
import com.user.service.UserService;

@Controller
@RequestMapping("/")
public class OrderController {
    
    @Inject
    private OrderService orderService;
    
    @Inject
    private CartService cartService;
    
    @Inject
    private UserService userService;

    
    @RequestMapping("orderList.do")
    public ModelAndView orderList(HttpSession session) throws Exception {
    	
    	String user_id = (String) session.getAttribute("user_id");
        List<OrderVO> orderList = orderService.orderList(user_id);
        ModelAndView mav = new ModelAndView("orderList");
        
        mav.addObject("orderList", orderList);
        mav.addObject("user_id", user_id);
        
        return mav;
    }
    
	@RequestMapping(value="orderWrite.do",method=RequestMethod.GET)
	public ModelAndView orderWrite(HttpSession session, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView();
        String user_id = (String) session.getAttribute("user_id");
        List<CartVO> cartList = cartService.cartList(user_id);
        Map<String, Object> map = new HashMap<>();
        
        int sumMoney = cartService.sumMoneyCart(user_id);
        int fee = sumMoney >= 100000 ? 0 : 2500;
        int sumTot = cartService.sumTotCart(user_id);
        
        map.put("list", cartList);
        map.put("sumMoney", sumMoney);
        map.put("fee", fee);
        map.put("count", cartList.size());
        map.put("allSum", sumMoney + fee);
        map.put("sumTot", sumTot);
        
        
        model.addAttribute("map", map);
        model.addAttribute("cart_id", cartList.get(0).getCart_id());
        model.addAttribute("dto", userService.viewUser(user_id));
        mav.addObject("cartList", cartList);
        mav.setViewName("orderWrite");
        
        return mav;
	}
    
	
	@RequestMapping("orderDetail{order_id}")
	public ModelAndView detail(@PathVariable("order_id") int order_id, ModelAndView mav) throws Exception {
	   mav.setViewName("/orderDetail");
	   mav.addObject("vo", orderService.orderDetail(order_id));
	   return mav;
	}

    // 주문 처리
    @RequestMapping(value = "orderInsert.do", method = RequestMethod.POST)
    public String orderInsert(@ModelAttribute OrderVO vo, HttpSession session) throws Exception {
    	
    	String user_id = (String) session.getAttribute("user_id");
    	vo.setUser_id(user_id);
    	
    	orderService.insertOrder(vo);
    	System.out.println(vo);
    	
    	orderService.cartAllDelete(user_id);
    	
		return "redirect:/orderList.do";

    }
		
	
	@RequestMapping("orderUpdate.do")
	public String updateOrder(@ModelAttribute OrderVO vo, Model model) throws Exception {
			orderService.updateOrder(vo);
			return "redirect:/orderList.do";
	}
    
	@RequestMapping("orderDelete.do")
    public String deleteOrder(@RequestParam int order_id) throws Exception {
        orderService.deleteOrder(order_id);
        return "redirect:/orderList.do";
    }

}