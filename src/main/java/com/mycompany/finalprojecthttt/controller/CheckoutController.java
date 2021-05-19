package com.mycompany.finalprojecthttt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.mycompany.finalprojecthttt.models.DoanhthuDAO;
import com.mycompany.finalprojecthttt.models.DoanhthuModel;
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
@RequestMapping(value = "/checkout")
public class CheckoutController {

    private int quantityOfCart(HttpSession session) {
        int result = 0;
        List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
        for (int i = 0; i < cart.size(); i++) {
            result += cart.get(i).getQuantity();
        }
        return result;
    }
    
    @RequestMapping(value = "/checkoutPage", method = RequestMethod.GET)
    public String checkout(ModelMap map, HttpSession session) {
        if (session.getAttribute("user") == null){
            map.put("invalidUser", "errorUser");
        }
        return "checkoutIndex";
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

        return "checkoutIndex";
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

    @RequestMapping(value = "/order", method = RequestMethod.POST)
    public String order(ModelMap map, HttpSession session, @RequestParam("address") String address, @RequestParam("phone") String phone) {
        List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
        int maTaiKhoan = (int) session.getAttribute("userID");

        for (int i = 0; i < cart.size(); i++) {
            SachModel sach = SachDAO.get(cart.get(i).getBook().getMaSach());
            if (sach.getSoLuong() > cart.get(i).getQuantity()) {
                DoanhthuModel model = new DoanhthuModel(cart.get(i).getBook().getMaSach(), maTaiKhoan, cart.get(i).getQuantity(), cart.get(i).getQuantity() * cart.get(i).getBook().getGia(), address, phone);
                DoanhthuDAO.add(model);
            
                sach.setSoLuong(sach.getSoLuong() - cart.get(i).getQuantity());
                SachDAO.add(sach);
            }
        }

        session.removeAttribute("cart");
        session.removeAttribute("cartSize");
        
        return "redirect:/index.htm";
    }
}