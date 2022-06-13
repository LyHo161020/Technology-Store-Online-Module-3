package controller;

import model.Product;
import model.User;
import service.UserService;
import utils.ValidateUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {

    private static final UserService userService = new UserService();
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
            case "block":
                showBlockUser(req,resp);
                break;
            default:
                listUser(req,resp);
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
            case "block":
                try {
                    blockUser(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                listUser(req,resp);
                break;
        }
    }

    private void blockUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        String message = userService.deleteUser(id);
        User user = userService.selectUser(id);
        req.setAttribute("message",message);
        req.setAttribute("user",user);

        RequestDispatcher dispatcher = req.getRequestDispatcher("user/block.jsp");
        dispatcher.forward(req,resp);
    }

    private void showBlockUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        String idStr = req.getParameter("id");
        User user = null;
        if(!ValidateUtils.isNumberValid(idStr)){
            errors.add("ID không hợp lệ!");
        }else {
            int id = Integer.parseInt(idStr);
            user = userService.selectUser(id);
            if(user != null) {
                    req.setAttribute("user", user);
            }else {
                errors.add("Không tồn tại người dùng có id là:" + id);
            }

        }

        if(errors.size() > 0) {
            req.setAttribute("errors",errors);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/block.jsp");
        dispatcher.forward(req,resp);




//        int id = Integer.parseInt(req.getParameter("id"));
//        User user = userService.selectUser(id);
//        req.setAttribute("user",user);
//
//        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/block.jsp");
//        dispatcher.forward(req,resp);

    }

    private void listUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users =  userService.selectAllUser();
        req.setAttribute("users",users);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/list.jsp");
        dispatcher.forward(req,resp);
    }
}
