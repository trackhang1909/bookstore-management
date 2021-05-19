/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalprojecthttt.controller;

import com.mycompany.finalprojecthttt.models.DoanhthuDAO;
import com.mycompany.finalprojecthttt.models.LoaiSachDAO;
import com.mycompany.finalprojecthttt.models.LoaiSachModel;
import com.mycompany.finalprojecthttt.models.NCCDAO;
import com.mycompany.finalprojecthttt.models.NCCModel;
import com.mycompany.finalprojecthttt.models.NXBDAO;
import com.mycompany.finalprojecthttt.models.NXBModel;
import com.mycompany.finalprojecthttt.models.SachDAO;
import com.mycompany.finalprojecthttt.models.SachModel;
import com.mycompany.finalprojecthttt.models.TTSachDAO;
import com.mycompany.finalprojecthttt.models.TTSachModel;
import com.mycompany.finalprojecthttt.models.TacGiaDAO;
import com.mycompany.finalprojecthttt.models.TacGiaModel;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Trac Khang
 */
@Controller
@RequestMapping(value = "/storage")
public class qlkhoController {
    
    @RequestMapping(value = "/doanhthu", method = RequestMethod.GET)
    public String doanhthu(ModelMap map) {
        map.put("doanhthu", DoanhthuDAO.getAll());
        return "doanhthu";
    }

    @RequestMapping(value = "/qlkho", method = RequestMethod.GET)
    public String qlkho() {
        return "qlkho";
    }

    @RequestMapping(value = "/dssach", method = RequestMethod.GET)
    public String dssach(ModelMap map) {
        List<SachModel> list = SachDAO.getAll();
        map.put("ds", list);
        return "dssach";
    }

    @RequestMapping(value = "/xoasach", method = RequestMethod.GET)
    public String xoasach(@RequestParam int id) {
        SachDAO.delete(id);
        return "redirect:dssach.htm";
    }

    @RequestMapping(value = "/themsach", method = RequestMethod.GET)
    public String themsach(ModelMap map) {
        List<LoaiSachModel> list = LoaiSachDAO.getAll();
        map.put("dsloaisach", list);
        List<TacGiaModel> list2 = TacGiaDAO.getAll();
        map.put("dstacgia", list2);
        List<NXBModel> list3 = NXBDAO.getAll();
        map.put("dsnxb", list3);
        List<NCCModel> list4 = NCCDAO.getAll();
        map.put("dsncc", list4);
        List<TTSachModel> list5 = TTSachDAO.getAll();
        map.put("dstts", list5);
        map.put("sach", new SachModel());
        return "themsach";
    }

    @RequestMapping(value = "/themsach", method = RequestMethod.POST)
    public String themsach(@Valid @ModelAttribute("sach") SachModel model, BindingResult br, ModelMap map, @RequestParam("file") MultipartFile[] files,
            HttpServletRequest request) {
        if (!br.hasErrors()) {
            try {
                String[] nameImage = uploadFile(request, files);
                if (nameImage.length != 0) {
                    model.setHinh1(nameImage[0]);
                    model.setHinh2(nameImage[1]);
                    model.setHinh3(nameImage[2]);
                }
                //Check duplicate
                List<SachModel> listCheck = SachDAO.getAll();
                for (SachModel item : listCheck) {
                    if (item.getTenSach().equals(model.getTenSach())) {
                        map.put("msg2", "Tên sách không được trùng");
                        map.put("sach", model);
                        List<LoaiSachModel> list = LoaiSachDAO.getAll();
                        map.put("dsloaisach", list);
                        List<TacGiaModel> list2 = TacGiaDAO.getAll();
                        map.put("dstacgia", list2);
                        List<NXBModel> list3 = NXBDAO.getAll();
                        map.put("dsnxb", list3);
                        List<NCCModel> list4 = NCCDAO.getAll();
                        map.put("dsncc", list4);
                        List<TTSachModel> list5 = TTSachDAO.getAll();
                        map.put("dstts", list5);
                        return "themsach";
                    }
                }

                SachDAO.add(model);
                return "redirect:dssach.htm";
            } catch (Exception ex) {
                map.put("msg", "Error: " + ex.getMessage());
            }
        }
        map.put("sach", model);
        List<LoaiSachModel> list = LoaiSachDAO.getAll();
        map.put("dsloaisach", list);
        List<TacGiaModel> list2 = TacGiaDAO.getAll();
        map.put("dstacgia", list2);
        List<NXBModel> list3 = NXBDAO.getAll();
        map.put("dsnxb", list3);
        List<NCCModel> list4 = NCCDAO.getAll();
        map.put("dsncc", list4);
        List<TTSachModel> list5 = TTSachDAO.getAll();
        map.put("dstts", list5);

        return "themsach";
    }

    @RequestMapping(value = "/suasach", method = RequestMethod.GET)
    public String suasach(ModelMap map, @RequestParam int id) {
        List<LoaiSachModel> list = LoaiSachDAO.getAll();
        map.put("dsloaisach", list);
        List<TacGiaModel> list2 = TacGiaDAO.getAll();
        map.put("dstacgia", list2);
        List<NXBModel> list3 = NXBDAO.getAll();
        map.put("dsnxb", list3);
        List<NCCModel> list4 = NCCDAO.getAll();
        map.put("dsncc", list4);
        List<TTSachModel> list5 = TTSachDAO.getAll();
        map.put("dstts", list5);
        map.put("sach", SachDAO.get(id));
        //map.put("id", id);
        return "suasach";
    }

    @RequestMapping(value = "/suasach", method = RequestMethod.POST)
    public String suasach(@Valid @ModelAttribute("sach") SachModel model, BindingResult br, ModelMap map, @RequestParam("file") MultipartFile[] files,
            HttpServletRequest request) {
        if (!br.hasErrors()) {
            try {

                String[] nameImage = uploadFile(request, files);

                if (files[0].getSize() != 0) {
                    model.setHinh1(nameImage[0]);
                }
                if (files[1].getSize() != 0) {
                    model.setHinh2(nameImage[1]);
                }
                if (files[2].getSize() != 0) {
                    model.setHinh3(nameImage[2]);
                }

                //Check duplicate
                List<SachModel> listCheck = SachDAO.getAll();
                for (SachModel item : listCheck) {

                    if (item.getTenSach().equals(model.getTenSach()) && !item.getTenSach().equals(SachDAO.get(model.getMaSach()).getTenSach())) {
                        map.put("msg2", "Tên sách không được trùng");
                        map.put("sach", model);
                        List<LoaiSachModel> list = LoaiSachDAO.getAll();
                        map.put("dsloaisach", list);
                        List<TacGiaModel> list2 = TacGiaDAO.getAll();
                        map.put("dstacgia", list2);
                        List<NXBModel> list3 = NXBDAO.getAll();
                        map.put("dsnxb", list3);
                        List<NCCModel> list4 = NCCDAO.getAll();
                        map.put("dsncc", list4);
                        List<TTSachModel> list5 = TTSachDAO.getAll();
                        map.put("dstts", list5);
                        return "themsach";
                    }
                }

                SachDAO.add(model);
                return "redirect:dssach.htm";
            } catch (Exception ex) {
                map.put("msg", "Error: " + ex.getMessage());
            }
        }
        map.put("sach", model);
        List<LoaiSachModel> list = LoaiSachDAO.getAll();
        map.put("dsloaisach", list);
        List<TacGiaModel> list2 = TacGiaDAO.getAll();
        map.put("dstacgia", list2);
        List<NXBModel> list3 = NXBDAO.getAll();
        map.put("dsnxb", list3);
        List<NCCModel> list4 = NCCDAO.getAll();
        map.put("dsncc", list4);
        List<TTSachModel> list5 = TTSachDAO.getAll();
        map.put("dstts", list5);
        return "suasach";
    }

    @RequestMapping(value = "/dsloaisach", method = RequestMethod.GET)
    public String dsloaisach(ModelMap map) {
        List<LoaiSachModel> list = LoaiSachDAO.getAll();
        map.put("ds", list);
        map.put("loaisach", new LoaiSachModel());
        return "dsloaisach";
    }

    @RequestMapping(value = "/dsloaisach", method = RequestMethod.POST)
    public String dsloaisach(@Valid @ModelAttribute("loaisach") LoaiSachModel model, BindingResult br, ModelMap map) {
        List<LoaiSachModel> list = LoaiSachDAO.getAll();
        if (!br.hasErrors()) {
            try {
                for (LoaiSachModel item : list) {
                    if (item.getTenLoaiSach().equals(model.getTenLoaiSach())) {
                        map.put("loaisach", new LoaiSachModel());
                        map.put("ds", list);
                        map.put("msg", "Tên loại sách không được trùng");
                        return "dsloaisach";
                    }
                }
                LoaiSachDAO.add(model);
                return "redirect:dsloaisach.htm";
            } catch (Exception ex) {
                map.put("msg", "Error: " + ex.getMessage());
            }
        }
        map.put("loaisach", new LoaiSachModel());
        map.put("ds", list);
        return "dsloaisach";
    }

    @RequestMapping(value = "/sualsach", method = RequestMethod.POST)
    public String sualsach(@RequestParam("maLoaiSach") String ma, @RequestParam("tenLoaiSach") String ten, ModelMap map) {
        List<LoaiSachModel> list = LoaiSachDAO.getAll();
        try {
            LoaiSachModel model = new LoaiSachModel();
            model.setMaLoaiSach(Integer.parseInt(ma));
            model.setTenLoaiSach(ten);
            for (LoaiSachModel item : list) {
                if (item.getTenLoaiSach().equals(ten)
                        && !item.getTenLoaiSach().equals(LoaiSachDAO.get(Integer.parseInt(ma)).getTenLoaiSach())) {
                    map.put("loaisach", new LoaiSachModel());
                    map.put("ds", list);
                    map.put("msg", "Tên loại sách không được trùng");
                    return "dsloaisach";
                }
            }
            LoaiSachDAO.add(model);
            return "redirect:dsloaisach.htm";
        } catch (Exception ex) {
            map.put("msg", "Error: " + ex.getMessage());
            map.put("loaisach", new LoaiSachModel());
            map.put("ds", list);
            return "dsloaisach";
        }
    }

    @RequestMapping(value = "/xoalsach", method = RequestMethod.GET)
    public String xoalsach(@RequestParam int id, ModelMap map) {
        try {
            LoaiSachDAO.delete(id);
            return "redirect:dsloaisach.htm";
        } catch (Exception ex) {
            List<LoaiSachModel> list = LoaiSachDAO.getAll();
            map.put("msg", "Error: " + ex.getMessage());
            map.put("loaisach", new LoaiSachModel());
            map.put("ds", list);
            return "dsloaisach";
        }
    }

    @RequestMapping(value = "/dsncc", method = RequestMethod.GET)
    public String dsncc(ModelMap map) {
        List<NCCModel> list = NCCDAO.getAll();
        map.put("ds", list);
        map.put("ncc", new NCCModel());
        return "dsncc";
    }

    @RequestMapping(value = "/dsncc", method = RequestMethod.POST)
    public String dsncc(@Valid @ModelAttribute("ncc") NCCModel model, BindingResult br, ModelMap map) {
        List<NCCModel> list = NCCDAO.getAll();
        if (!br.hasErrors()) {
            try {

                for (NCCModel item : list) {
                    if (item.getTenNCC().equals(model.getTenNCC())) {
                        map.put("ncc", new NCCModel());
                        map.put("ds", list);
                        map.put("msg", "Tên nhà cung cấp không được trùng");
                        return "dsncc";
                    }
                }

                NCCDAO.add(model);
                return "redirect:dsncc.htm";
            } catch (Exception ex) {
                map.put("msg", "Error: " + ex.getMessage());
            }
        }

        map.put("ncc", new NCCModel());
        map.put("ds", list);
        return "dsncc";

    }

    @RequestMapping(value = "/suancc", method = RequestMethod.POST)
    public String suancc(@RequestParam("maNCC") String ma, @RequestParam("tenNCC") String ten, ModelMap map) {
        List<NCCModel> list = NCCDAO.getAll();
        try {
            NCCModel model = new NCCModel();
            model.setMaNCC(Integer.parseInt(ma));
            model.setTenNCC(ten);
            for (NCCModel item : list) {
                if (item.getTenNCC().equals(ten)
                        && !item.getTenNCC().equals(NCCDAO.get(Integer.parseInt(ma)).getTenNCC())) {
                    map.put("ncc", new NCCModel());
                    map.put("ds", list);
                    map.put("msg", "Tên nhà cung cấp không được trùng");
                    return "dsncc";
                }
            }
            NCCDAO.add(model);
            return "redirect:dsncc.htm";
        } catch (Exception ex) {
            map.put("msg", "Error: " + ex.getMessage());
            map.put("ncc", new NCCModel());
            map.put("ds", list);
            return "dsncc";
        }
    }

    @RequestMapping(value = "/xoancc", method = RequestMethod.GET)
    public String xoancc(@RequestParam int id, ModelMap map) {
        try {
            NCCDAO.delete(id);
            return "redirect:dsncc.htm";
        } catch (Exception ex) {
            List<NCCModel> list = NCCDAO.getAll();
            map.put("msg", "Error: " + ex.getMessage());
            map.put("ncc", new NCCModel());
            map.put("ds", list);
            return "dsncc";
        }
    }

    @RequestMapping(value = "/dsnxb", method = RequestMethod.GET)
    public String dsnxb(ModelMap map) {
        List<NXBModel> list = NXBDAO.getAll();
        map.put("ds", list);
        map.put("nxb", new NXBModel());
        return "dsnxb";
    }

    @RequestMapping(value = "/dsnxb", method = RequestMethod.POST)
    public String dsnxb(@Valid @ModelAttribute("nxb") NXBModel model, BindingResult br, ModelMap map) {
        List<NXBModel> list = NXBDAO.getAll();
        if (!br.hasErrors()) {
            try {

                for (NXBModel item : list) {
                    if (item.getTenNXB().equals(model.getTenNXB())) {
                        map.put("nxb", new NXBModel());
                        map.put("ds", list);
                        map.put("msg", "Tên nhà xuất bản không được trùng");
                        return "dsnxb";
                    }
                }

                NXBDAO.add(model);
                return "redirect:dsnxb.htm";
            } catch (Exception ex) {
                map.put("msg", "Error: " + ex.getMessage());
            }
        }

        map.put("nxb", new NXBModel());
        map.put("ds", list);
        return "dsnxb";

    }

    @RequestMapping(value = "/suanxb", method = RequestMethod.POST)
    public String suanxb(@RequestParam("maNXB") String ma, @RequestParam("tenNXB") String ten, ModelMap map) {
        List<NXBModel> list = NXBDAO.getAll();
        try {
            NXBModel model = new NXBModel();
            model.setMaNXB(Integer.parseInt(ma));
            model.setTenNXB(ten);
            for (NXBModel item : list) {
                if (item.getTenNXB().equals(ten)
                        && !item.getTenNXB().equals(NXBDAO.get(Integer.parseInt(ma)).getTenNXB())) {
                    map.put("nxb", new NXBModel());
                    map.put("ds", list);
                    map.put("msg", "Tên nhà xuất bản không được trùng");
                    return "dsnxb";
                }
            }
            NXBDAO.add(model);
            return "redirect:dsnxb.htm";
        } catch (Exception ex) {
            map.put("msg", "Error: " + ex.getMessage());
            map.put("nxb", new NXBModel());
            map.put("ds", list);
            return "dsnxb";
        }
    }

    @RequestMapping(value = "/xoanxb", method = RequestMethod.GET)
    public String xoanxb(@RequestParam int id, ModelMap map) {
        try {
            NXBDAO.delete(id);
            return "redirect:dsnxb.htm";
        } catch (Exception ex) {
            List<NXBModel> list = NXBDAO.getAll();
            map.put("msg", "Error: " + ex.getMessage());
            map.put("nxb", new NXBModel());
            map.put("ds", list);
            return "dsnxb";
        }
    }

    @RequestMapping(value = "/dstacgia", method = RequestMethod.GET)
    public String dstacgia(ModelMap map) {
        List<TacGiaModel> list = TacGiaDAO.getAll();
        map.put("ds", list);
        map.put("tacgia", new TacGiaModel());
        return "dstacgia";
    }

    @RequestMapping(value = "/dstacgia", method = RequestMethod.POST)
    public String dstacgia(@Valid @ModelAttribute("tacgia") TacGiaModel model, BindingResult br, ModelMap map) {
        List<TacGiaModel> list = TacGiaDAO.getAll();
        if (!br.hasErrors()) {
            try {

                for (TacGiaModel item : list) {
                    if (item.getTenTacGia().equals(model.getTenTacGia())) {
                        map.put("tacgia", new TacGiaModel());
                        map.put("ds", list);
                        map.put("msg", "Tên tác giả không được trùng");
                        return "dstacgia";
                    }
                }

                TacGiaDAO.add(model);
                return "redirect:dstacgia.htm";
            } catch (Exception ex) {
                map.put("msg", "Error: " + ex.getMessage());
            }
        }

        map.put("tacgia", new TacGiaModel());
        map.put("ds", list);
        return "dstacgia";

    }

    @RequestMapping(value = "/suatg", method = RequestMethod.POST)
    public String suatg(@RequestParam("maTacGia") String ma, @RequestParam("tenTacGia") String ten, ModelMap map) {
        List<TacGiaModel> list = TacGiaDAO.getAll();
        try {
            TacGiaModel model = new TacGiaModel();
            model.setMaTacGia(Integer.parseInt(ma));
            model.setTenTacGia(ten);
            for (TacGiaModel item : list) {
                if (item.getTenTacGia().equals(ten)
                        && !item.getTenTacGia().equals(TacGiaDAO.get(Integer.parseInt(ma)).getTenTacGia())) {
                    map.put("tacgia", new TacGiaModel());
                    map.put("ds", list);
                    map.put("msg", "Tên tác giả không được trùng");
                    return "dstacgia";
                }
            }
            TacGiaDAO.add(model);
            return "redirect:dstacgia.htm";
        } catch (Exception ex) {
            map.put("msg", "Error: " + ex.getMessage());
            map.put("tacgia", new TacGiaModel());
            map.put("ds", list);
            return "dstacgia";
        }
    }

    @RequestMapping(value = "/xoatg", method = RequestMethod.GET)
    public String xoatg(@RequestParam int id, ModelMap map) {
        try {
            TacGiaDAO.delete(id);
            return "redirect:dstacgia.htm";
        } catch (Exception ex) {
            List<TacGiaModel> list = TacGiaDAO.getAll();
            map.put("msg", "Error: " + ex.getMessage());
            map.put("tacgia", new TacGiaModel());
            map.put("ds", list);
            return "dstacgia";
        }
    }

    @RequestMapping(value = "/dstts", method = RequestMethod.GET)
    public String dstts(ModelMap map) {
        List<TTSachModel> list = TTSachDAO.getAll();
        map.put("ds", list);
        map.put("tts", new TTSachModel());
        return "dstts";
    }

    @RequestMapping(value = "/dstts", method = RequestMethod.POST)
    public String dstts(@Valid @ModelAttribute("tts") TTSachModel model, BindingResult br, ModelMap map) {
        List<TTSachModel> list = TTSachDAO.getAll();
        if (!br.hasErrors()) {
            try {

                for (TTSachModel item : list) {
                    if (item.getTinhTrang().equals(model.getTinhTrang())) {
                        map.put("tts", new TTSachModel());
                        map.put("ds", list);
                        map.put("msg", "Tên tình trạng sách không được trùng");
                        return "dstts";
                    }
                }

                TTSachDAO.add(model);
                return "redirect:dstts.htm";
            } catch (Exception ex) {
                map.put("msg", "Error: " + ex.getMessage());
            }
        }

        map.put("tts", new TTSachModel());
        map.put("ds", list);
        return "dstts";

    }

    @RequestMapping(value = "/suatts", method = RequestMethod.POST)
    public String suatts(@RequestParam("maTTS") String ma, @RequestParam("tinhTrang") String ten, ModelMap map) {
        List<TTSachModel> list = TTSachDAO.getAll();
        try {
            TTSachModel model = new TTSachModel();
            model.setMaTTS(Integer.parseInt(ma));
            model.setTinhTrang(ten);
            for (TTSachModel item : list) {
                if (item.getTinhTrang().equals(ten)
                        && !item.getTinhTrang().equals(TTSachDAO.get(Integer.parseInt(ma)).getTinhTrang())) {
                    map.put("tts", new TTSachModel());
                    map.put("ds", list);
                    map.put("msg", "Tên tình trạng sách không được trùng");
                    return "dstts";
                }
            }
            TTSachDAO.add(model);
            return "redirect:dstts.htm";
        } catch (Exception ex) {
            map.put("msg", "Error: " + ex.getMessage());
            map.put("tts", new TTSachModel());
            map.put("ds", list);
            return "dstts";
        }
    }

    @RequestMapping(value = "/xoatts", method = RequestMethod.GET)
    public String xoatts(@RequestParam int id, ModelMap map) {
        try {
            TTSachDAO.delete(id);
            return "redirect:dstts.htm";
        } catch (Exception ex) {
            List<TTSachModel> list = TTSachDAO.getAll();
            map.put("msg", "Error: " + ex.getMessage());
            map.put("tts", new TTSachModel());
            map.put("ds", list);
            return "dstts";
        }
    }

    private String[] uploadFile(HttpServletRequest request, MultipartFile[] files) {
        if (files.length != 0) {
            try {
                String[] name = new String[files.length];
                for (int i = 0; i < files.length; i++) {

                    byte[] bytes = files[i].getBytes();
                    //Create the directory
                    String rootPath = request.getSession().getServletContext().getRealPath("/") + "resources";
                    File dir = new File(rootPath + File.separator + "images");
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }
                    //Create file on server
                    name[i] = String.valueOf(new Date().getTime() + ".jpg");
                    File serverFile = new File(dir.getAbsolutePath()
                            + File.separator + name[i]);
                    try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile))) {
                        stream.write(bytes);
                    }

                }
                return name;
            } catch (IOException e) {
                return null;
            }
        }
        return null;
    }

}
