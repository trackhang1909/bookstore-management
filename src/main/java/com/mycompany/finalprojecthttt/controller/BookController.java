/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalprojecthttt.controller;

import com.mycompany.finalprojecthttt.models.NhanXetDAO;
import com.mycompany.finalprojecthttt.models.NhanXetModel;
import com.mycompany.finalprojecthttt.models.SachDAO;
import com.mycompany.finalprojecthttt.models.SachModel;
import java.sql.SQLException;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author deptr
 */
@Controller
@RequestMapping(value = "/book")
public class BookController {

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail(ModelMap map, int id) throws ClassNotFoundException, SQLException {
        SachModel book = SachDAO.get(id);
        map.put("items", book);
        map.put("nhanXet", new NhanXetModel());
        map.put("allnx", NhanXetDAO.gets(id));
        return "detail";
    }

    @RequestMapping(value = "/nhanxet", method = RequestMethod.POST)
    public String nhanxet(ModelMap map, @Valid @ModelAttribute("nhanxet") NhanXetModel model,
            @RequestParam("maSach") String maSach, @RequestParam("maTK") String maTK){
        if (maTK.equals("")) {
            map.put("notacc", "Bạn phải đăng nhập tài khoản để nhận xét");
            SachModel book = SachDAO.get(Integer.parseInt(maSach));
            map.put("items", book);
            map.put("nhanXet", new NhanXetModel());
            map.put("allnx", NhanXetDAO.gets(Integer.parseInt(maSach)));
            return "detail";
        }
        model.setMaSach(Integer.parseInt(maSach));
        model.setMaTaiKhoan(Integer.parseInt(maTK));
        NhanXetDAO.add(model);
        SachModel book = SachDAO.get(Integer.parseInt(maSach));
        map.put("items", book);
        map.put("nhanXet", new NhanXetModel());
        map.put("allnx", NhanXetDAO.gets(Integer.parseInt(maSach)));
        return "detail";
    }
}
