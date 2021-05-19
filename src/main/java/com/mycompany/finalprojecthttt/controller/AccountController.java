package com.mycompany.finalprojecthttt.controller;

import java.sql.SQLException;

import com.mycompany.finalprojecthttt.models.Taikhoan;
import com.mycompany.finalprojecthttt.models.TaikhoanDAO;
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
@RequestMapping(value = "/account")
public class AccountController {

    /* LOGIN */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGET(ModelMap map) throws ClassNotFoundException, SQLException {
        map.put("account", new Taikhoan());
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginPOST(@ModelAttribute("account") Taikhoan account, ModelMap map, HttpSession session)
            throws ClassNotFoundException, SQLException {
        // Check username and password
        if (TaikhoanDAO.getAccount(account.getTenDangNhap(), account.getMatKhau()) != null) {

            Taikhoan passAccount = TaikhoanDAO.getAccount(account.getTenDangNhap(), account.getMatKhau());
            // Create session
            session.setAttribute("user", passAccount.getTenDangNhap());
            session.setAttribute("role", passAccount.getRole());
            session.setAttribute("userID", passAccount.getMaTaiKhoan());

            return "redirect:/index.htm";
        } else {
            // Message error
            map.put("message", "Tên đăng nhập hoặc mật khẩu không đúng, vui lòng nhập lại!");
            return "login";
        }
    }

    /* LOGOUT */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) throws ClassNotFoundException, SQLException {
        session.removeAttribute("user");
        session.removeAttribute("role");
        session.removeAttribute("userID");
        return "redirect:/index.htm";
    }

    /* REGISTRY */
    @RequestMapping(value = "/registry", method = RequestMethod.GET)
    public String registryGET(ModelMap map) throws ClassNotFoundException, SQLException {
        Taikhoan account = new Taikhoan();
        account.setRole(0);
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
                TaikhoanDAO.addAccount(account);
                return "redirect:/index.htm";
            }
        }

        map.put("account", account);
        return "registry";
    }
}
