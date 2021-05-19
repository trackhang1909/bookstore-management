package com.mycompany.finalprojecthttt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mycompany.finalprojecthttt.models.ItemCart;
import com.mycompany.finalprojecthttt.models.SachDAO;
import com.mycompany.finalprojecthttt.models.SachModel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/cart")
public class CartController {

    private int quantityOfCart(HttpSession session) {
        int result = 0;
        List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
        for (int i = 0; i < cart.size(); i++) {
            result += cart.get(i).getQuantity();
        }
        return result;
    }

    @RequestMapping(value = "/orderNow/{id}", method = RequestMethod.GET)
    public String orderNow(@PathVariable(value = "id") int id, ModelMap map, HttpSession session) {
        if (session.getAttribute("cart") == null) {
            List<ItemCart> cart = new ArrayList<ItemCart>();
            cart.add(new ItemCart(SachDAO.get(id), 1));
            session.setAttribute("cart", cart);
        } else {
            List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
            int index = isExistItem(id, session);

            if (index == -1) {
                cart.add(new ItemCart(SachDAO.get(id), 1));
            } else {
                int quantity = cart.get(index).getQuantity() + 1;
                cart.get(index).setQuantity(quantity);
            }
            session.setAttribute("cart", cart);
        }
        int quantity = quantityOfCart(session);
        session.setAttribute("cartSize", quantity);
        return "cartIndex";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable(value = "id") int id, HttpSession session) {
        List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");

        int index = isExistItem(id, session);

        cart.remove(index);

        int quantity = quantityOfCart(session);
        session.setAttribute("cartSize", quantity);

        if (quantity <= 0) {
            session.removeAttribute("cartSize");
        }

        return "cartIndex";
    }

    @RequestMapping(value = "/orderNow", method = RequestMethod.GET)
    public String cart() {
        return "cartIndex";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteCart(HttpSession session) {
        session.removeAttribute("cart");
        session.removeAttribute("cartSize");
        return "cartIndex";
    }

    private int isExistItem(int id, HttpSession session) {
        List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getBook().getMaSach() == id) {
                return i;
            }
        }
        return -1;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(HttpServletRequest request, HttpSession session) {
        List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");

        if (cart == null){
            return "redirect:/cart/orderNow.htm";
        }

        String[] quantity = request.getParameterValues("quantity");

        for (int i = 0; i < cart.size(); i++) {
            cart.get(i).setQuantity(Integer.parseInt(quantity[i]));
        }
        session.setAttribute("cart", cart);

        int quantityCart = quantityOfCart(session);
        session.setAttribute("cartSize", quantityCart);

        if (quantityCart <= 0){
            session.removeAttribute("cartSize");
        }

        return "redirect:/cart/orderNow.htm";
    }

    @RequestMapping(value = "/addCart/{id}", method = RequestMethod.POST)
    public String addCart(@PathVariable(value = "id") int id, HttpServletRequest request, HttpSession session) {
        String[] quantity = request.getParameterValues("quantity");

        // If Cart don't have item
        if (session.getAttribute("cart") == null) {
            List<ItemCart> cart = new ArrayList<ItemCart>();
            cart.add(new ItemCart(SachDAO.get(id), Integer.parseInt(quantity[0])));
            session.setAttribute("cart", cart);

        } else {    // Cart have item
            List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
            int index = isExistItem(id, session);

            if (index == -1) {
                cart.add(new ItemCart(SachDAO.get(id), Integer.parseInt(quantity[0])));
            } else {
                int quantityAdd = cart.get(index).getQuantity() + Integer.parseInt(quantity[0]);
                cart.get(index).setQuantity(quantityAdd);

            }
            session.setAttribute("cart", cart);
        }
        int quantityCart = quantityOfCart(session);
        session.setAttribute("cartSize", quantityCart);
        return "redirect:/book/detail.htm?id="+id;
    }
}
