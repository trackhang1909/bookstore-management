/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalprojecthttt.controller;

import com.mycompany.finalprojecthttt.models.Taikhoan;
import com.mycompany.finalprojecthttt.models.TaikhoanDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author deptr
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    /* REGISTRY */
    @RequestMapping(value = "/registry", method = RequestMethod.GET)
    public String registryGET(ModelMap map) throws ClassNotFoundException, SQLException {
        Taikhoan account = new Taikhoan();
        map.put("account", account);
        return "registry";
    }

    @RequestMapping(value = "/registry", method = RequestMethod.POST)
    public String registryPOST(@Valid @ModelAttribute("account") Taikhoan account, BindingResult br, ModelMap map,
            HttpSession session, @RequestParam("confirmPass") String confPass)
            throws ClassNotFoundException, SQLException {
        // Check username and password
        boolean userInDB = TaikhoanDAO.findTenDangNhap(account.getTenDangNhap());

        // Error username
        if (userInDB) {
            map.put("message", "Tên đăng nhập đã tồn tại, vui lòng chọn tên khác!");
            // return "registry";
        }

        if (!account.getMatKhau().equals(confPass)) {
            map.put("messagePass", "Mật khẩu không khớp, vui lòng nhập lại!");
            // return "registry";
        }

        if (!br.hasErrors()) {
            if (account.getMatKhau().equals(confPass) && !userInDB) {
                account.setRole(2);
                TaikhoanDAO.addAccount(account);
                return "redirect:/index.htm";
            }
        }

        map.put("account", account);
        return "registry";
    }
}
