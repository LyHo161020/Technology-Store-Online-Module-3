package controller;

import model.Product;
import service.ProductService;
import utils.ValidateUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private static final ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html/charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action){
            case "create":
                showCreateForm(req,resp);
                break;
            case "edit":
                showEditForm(req,resp);
                break;
            case "block":
                showDeleteForm(req,resp);
                break;
            default:
                dashBoard(req,resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html/charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action){
            case "create":
                try {
                    createProduct(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "edit":
                try {
                    editProduct(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "block":
                try {
                    deleteProduct(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                dashBoard(req,resp);
                break;
        }
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        String message = productService.deleteProduct(id);
        Product product = productService.selectProduct(id);
        req.setAttribute("message",message);
        req.setAttribute("product",product);

        RequestDispatcher dispatcher = req.getRequestDispatcher("product/delete.jsp");
        dispatcher.forward(req,resp);
    }

    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        List<String> errors = new ArrayList<>();
        List<Product> products = productService.selectAllProduct();

        String type = req.getParameter("type");
        String name = req.getParameter("name");
        String urlImage = req.getParameter("image");
        String amountStr = req.getParameter("amount");
        String priceStr = req.getParameter("price");

        System.out.println(urlImage.length());
        if(urlImage.length() > 65000) {
            errors.add("???????ng d???n ???nh qu?? d??i");
        }


        if(amountStr.length() > 9) {
            errors.add("S??? l?????ng t???i ??a l?? 999.999.999!");
        } else if (Integer.parseInt(amountStr) <= 0) {
            errors.add("S??? l?????ng ph???i l?? m???t s??? d????ng!");
        }

        if(priceStr.length() > 12) {
            errors.add("Gi?? ti???n t???i ??a c???a m???t s???n ph???m l?? 999.999.999.999??");
        } else if (Integer.parseInt(priceStr) <= 0) {
            errors.add("Gi?? ti???n kh??ng ???????c ??m!");
        }

        if(name.length() > 255) {
            errors.add("T??n qu?? d??i! T??n ch??? c?? th??? ch???a t???i ??a 255 k?? t???!");
        }

        for(Product pro : products){
            if(name.equals(pro.getName())){
                errors.add("S???n ph???m n??y ???? t???n t???i trong danh s??ch!");
                break;
            }
        }


        for(Product pro : products){
            if(urlImage.equals(pro.getImage())){
                errors.add("???nh n??y ???? thu???c m???t s???n ph???m ??? trong danh s??ch!");
                break;
            }
        }

        if(errors.size() > 0) {
            req.setAttribute("errors",errors);
        }else {
            int amount = Integer.parseInt(amountStr);
            int price = Integer.parseInt(priceStr);
            Product product = new Product(type, name,urlImage, amount,price);
            String message = productService.insertProduct(product);
            req.setAttribute("message",message);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/product/create.jsp");
        dispatcher.forward(req, resp);
    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        List<String> errors = new ArrayList<>();
        List<Product> products = productService.selectAllProduct();
        Product product = null;
        int id = 0;

        String idStr = req.getParameter("id");
        String type = req.getParameter("type");
        String name = req.getParameter("name");
        String urlImage = req.getParameter("image");
        String amountString = req.getParameter("amount");
        String priceString = req.getParameter("price");

        if(!ValidateUtils.isNumberValid(idStr)){
            errors.add("ID kh??ng h???p l???!");
        }else {
            id = Integer.parseInt(idStr);
            product = productService.selectProduct(id);
            if(product == null){
                errors.add("Kh??ng t???n t???i s???n ph???m c?? id l??:" + id);
            }else if(product.isDeleted()){
                errors.add("S???n ph???m ???? t???m th???i b??? xo?? kh??ng th??? s???a th??ng tin");
            }
        }

        if(amountString.length() > 9) {
            errors.add("S??? l?????ng t???i ??a l?? 999.999.999!");
        } else if (Integer.parseInt(amountString) <= 0) {
            errors.add("S??? l?????ng ph???i l?? m???t s??? d????ng!");
        }

        if(priceString.length() > 12) {
            errors.add("Gi?? ti???n t???i ??a c???a m???t s???n ph???m l?? 999.999.999.999??");
        } else if (Integer.parseInt(priceString) <= 0) {
            errors.add("Gi?? ti???n kh??ng ???????c ??m!");
        }

        if(name.length() > 255) {
            errors.add("T??n qu?? d??i! T??n ch??? c?? th??? ch???a t???i ??a 255 k?? t???!");
        }

        for(Product pro : products){
            if(name.equals(pro.getName()) && !name.equals(product.getName())){
                errors.add("S???n ph???m n??y ???? t???n t???i trong danh s??ch!");
                break;
            }

        }

        for(Product pro : products){
            if(urlImage.equals(pro.getImage()) && !urlImage.equals(product.getImage())){
                errors.add("???nh n??y ???? thu???c m???t s???n ph???m ??? trong danh s??ch!");
                break;
            }

        }

        if(errors.size() > 0){
            req.setAttribute("errors",errors);
        }else {
            int amount = Integer.parseInt(req.getParameter("amount"));
            int price = Integer.parseInt(req.getParameter("price"));
            product = new Product(id, type, name,urlImage, amount,price);
            String message = productService.updateProduct(product);
            req.setAttribute("message",message);
        }


        product = productService.selectProduct(id);
        req.setAttribute("product",product);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/product/edit.jsp");
        dispatcher.forward(req, resp);
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/product/create.jsp");
        dispatcher.forward(req,resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        String idStr = req.getParameter("id");
        Product product = null;
        if(!ValidateUtils.isNumberValid(idStr)){
            errors.add("ID kh??ng h???p l???!");
        }else {
            int id = Integer.parseInt(idStr);
            product = productService.selectProduct(id);
            if(product != null) {
                if(!product.isDeleted()) {
                    req.setAttribute("type", product.getType());
                    req.setAttribute("product", product);
                }else {
                    errors.add("S???n ph???m ???? b??? xo??!");
                }
            }else {
                errors.add("Kh??ng t???n t???i s???n ph???m c?? id l??:" + id);
            }

        }

        if(errors.size() > 0) {
            req.setAttribute("errors",errors);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/product/edit.jsp");
        dispatcher.forward(req,resp);
    }

    private void showDeleteForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<String> errors = new ArrayList<>();
        String idStr = req.getParameter("id");
        Product product = null;
        if(!ValidateUtils.isNumberValid(idStr)){
            errors.add("ID kh??ng h???p l???!");
        }else {
            int id = Integer.parseInt(idStr);
            product = productService.selectProduct(id);
            if(product != null) {
                if(!product.isDeleted()) {
                    req.setAttribute("type", product.getType());
                    req.setAttribute("product", product);
                }else {
                    errors.add("S???n ph???m n??y ???? b??? xo?? tr?????c ????!");
                }
            }else {
                errors.add("Kh??ng t???n t???i s???n ph???m c?? id l??:" + id);
            }

        }

        if(errors.size() > 0) {
            req.setAttribute("errors",errors);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/product/delete.jsp");
        dispatcher.forward(req,resp);
    }

    private void dashBoard(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.selectAllProduct();
        req.setAttribute("products",products);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/product/list.jsp");
        dispatcher.forward(req,resp);
    }
}
