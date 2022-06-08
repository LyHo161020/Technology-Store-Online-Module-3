package controller;

import model.Product;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    private static final ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action){
            case "create":
                showCreateForm(req,resp);
            case "edit":
                showEditForm(req,resp);
                break;
            default:
                dashBoard(req,resp);
                break;
        }
    }




    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action){
            case "create":
                showCreateForm(req,resp);
            case "edit":
                try {
                    editProduct(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                dashBoard(req,resp);
                break;
        }
    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        List<String> errors = new ArrayList<>();
        List<Product> products = productService.selectAllProduct();

        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.selectProduct(id);
        String type = req.getParameter("type");
        String name = req.getParameter("name");
        String amountString = req.getParameter("amount");
        String priceString = req.getParameter("price");

        if(amountString.length() > 9) {
            errors.add("Số lượng tối đa là 999.999.999!");
        } else if (Integer.parseInt(amountString) <= 0) {
            errors.add("Số lượng phải là một số dương!");
        }

        if(priceString.length() > 12) {
            errors.add("Giá tiền tối đa của một sản phẩm là 999.999.999.999đ");
        } else if (Integer.parseInt(priceString) <= 0) {
            errors.add("Giá tiền không được âm!");
        }

        if(name.length() > 255) {
            errors.add("Tên quá dài! Tên chỉ có thể chứa tối đa 255 kí tự!");
        }

        for(Product pro : products){
            if(name.equals(pro.getName()) && !name.equals(product.getName())){
                errors.add("Sản phẩm này đã tồn tại trong danh sách!");
                break;
            }

        }


        if(errors.size() > 0){
            req.setAttribute("errors",errors);
        }else {
            int amount = Integer.parseInt(req.getParameter("amount"));
            int price = Integer.parseInt(req.getParameter("price"));
            product = new Product(id, type, name, amount,price);
            String message = productService.updateProduct(product);
            req.setAttribute("message",message);
        }


        product = productService.selectProduct(id);
        req.setAttribute("product",product);
        RequestDispatcher dispatcher = req.getRequestDispatcher("product/edit.jsp");
        dispatcher.forward(req, resp);
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/product/create.jsp");
        dispatcher.forward(req,resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.selectProduct(id);
        req.setAttribute("product",product);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/product/edit.jsp");
        dispatcher.forward(req,resp);
    }

    private void dashBoard(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.selectAllProduct();
        req.setAttribute("products",products);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/product/list.jsp");
        dispatcher.forward(req,resp);
    }
}
