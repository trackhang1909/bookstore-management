/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalprojecthttt.controller;

import com.mycompany.finalprojecthttt.models.NCCDAO;
import com.mycompany.finalprojecthttt.models.NCCModel;
import com.mycompany.finalprojecthttt.models.NXBDAO;
import com.mycompany.finalprojecthttt.models.NXBModel;
import com.mycompany.finalprojecthttt.models.SachDAO;
import com.mycompany.finalprojecthttt.models.SachModel;
import com.mycompany.finalprojecthttt.models.TacGiaDAO;
import com.mycompany.finalprojecthttt.models.TacGiaModel;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author deptr
 */
@Controller
@RequestMapping(value = "/")
public class HomeController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String dssach(ModelMap map) {
        List<SachModel> listAll = SachDAO.getAll();
        List<SachModel> list = new ArrayList<>();
        for (SachModel it:listAll) {
            if (!it.getTTS(it.getMaTTS()).equals("Hết hàng")) {
                list.add(it);
            }
        }
        map.put("listBook", list);
        List<NXBModel> list3 = NXBDAO.getAll();
        map.put("dsnxb", list3);
        Set<Integer> namxb = new HashSet<Integer>();
        for (SachModel it:list) {
            namxb.add(it.getNamXB());
        }
        List<TacGiaModel> list2 = TacGiaDAO.getAll();
        List<NCCModel> list4 = NCCDAO.getAll();
        map.put("dsncc", list4);
        map.put("dstacgia", list2);
        map.put("namxb", namxb);
        
        return "index";
    }
    
    @RequestMapping(value = "/index", method = RequestMethod.POST)
    public String dssach(ModelMap map, @RequestParam("gia1") String gia1, @RequestParam("gia2") String gia2,
            @RequestParam("nam") Integer[] nam, @RequestParam("nhaxb") Integer[] nhaxb,
            @RequestParam("ncc") Integer[] ncc, @RequestParam("tacgia") Integer[] tacgia) {
        List<SachModel> listAll = SachDAO.getAll();
        List<SachModel> list = new ArrayList<>();
        for (SachModel it:listAll) {
            if (!it.getTTS(it.getMaTTS()).equals("Hết hàng")) {
                list.add(it);
            }
        }
        List<NXBModel> list3 = NXBDAO.getAll();
        Set<Integer> namxb = new HashSet<Integer>();
        for (SachModel it:list) {
            namxb.add(it.getNamXB());
        }
        List<TacGiaModel> list2 = TacGiaDAO.getAll();
        List<NCCModel> list4 = NCCDAO.getAll();
        
        try {
            Set<SachModel> listNew = new HashSet<SachModel>();
            //List<SachModel> listNew = new ArrayList<>();

            if (!gia1.equals("") && !gia2.equals("") || nam.length != 1 || nhaxb.length != 1 || ncc.length != 1 || tacgia.length != 1) {
                
                for (SachModel item:list) {
                    //Gia
                    if (!gia1.equals("") && !gia2.equals("")) {
                        if (item.getGia() >= Integer.parseInt(gia1) && item.getGia() <= Integer.parseInt(gia2)) {
                            listNew.add(item);
                        }
                    }

                    //Namxb
                    for (Integer it:nam) {
                        if (it == item.getNamXB()) {
                            listNew.add(item);
                        }
                    }

                    //Nhaxb
                    for (Integer it:nhaxb) {
                        if (it == item.getMaNXB()) {
                            listNew.add(item);
                        }
                    }

                    //Nhacc
                    for (Integer it:ncc) {
                        if (it == item.getMaNCC()) {
                            listNew.add(item);
                        }
                    }

                    //Tacgia
                    for (Integer it:tacgia) {
                        if (it == item.getMaTacGia()) {
                            listNew.add(item);
                        }
                    }

                }
                
                map.put("dsncc", list4);
                map.put("dstacgia", list2);
                map.put("dsnxb", list3);
                map.put("namxb", namxb);
                map.put("listBook", listNew);
                return "index";
                
            }

            map.put("dsncc", list4);
            map.put("dstacgia", list2);
            map.put("dsnxb", list3);
            map.put("namxb", namxb);
            map.put("listBook", list);
            return "index";
        }
        catch (Exception ex) {
            map.put("dsncc", list4);
            map.put("dstacgia", list2);
            map.put("dsnxb", list3);
            map.put("namxb", namxb);
            map.put("listBook", list);
            return "index";
        }
    }
    
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(ModelMap map, @RequestParam("search") String search) {
        List<SachModel> listAll = SachDAO.getAll();
        List<SachModel> list = new ArrayList<>();
        for (SachModel it:listAll) {
            if (!it.getTTS(it.getMaTTS()).equals("Hết hàng")) {
                list.add(it);
            }
        }
        List<NXBModel> list3 = NXBDAO.getAll();
        Set<Integer> namxb = new HashSet<Integer>();
        for (SachModel it:list) {
            namxb.add(it.getNamXB());
        }
        List<TacGiaModel> list2 = TacGiaDAO.getAll();
        List<NCCModel> list4 = NCCDAO.getAll();
        
        try {
            Set<SachModel> listNew = new HashSet<SachModel>();
            //List<SachModel> listNew = new ArrayList<>();
            
            if (!search.equals("")) {
                for (SachModel it:list) {
                    if (it.getTenSach().contains(search)) {
                        listNew.add(it);
                    }
                }
                map.put("dsncc", list4);
                map.put("dstacgia", list2);
                map.put("dsnxb", list3);
                map.put("namxb", namxb);
                map.put("listBook", listNew);
                return "index";
            }

            map.put("dsncc", list4);
            map.put("dstacgia", list2);
            map.put("dsnxb", list3);
            map.put("namxb", namxb);
            map.put("listBook", list);
            return "index";
        }
        catch (Exception ex) {
            map.put("dsncc", list4);
            map.put("dstacgia", list2);
            map.put("dsnxb", list3);
            map.put("namxb", namxb);
            map.put("listBook", list);
            return "index";
        }
    }
}
