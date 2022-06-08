package service;

import model.Order;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IOrderService {
    boolean insertOrder(Order order) throws SQLException;

    Order selectOrder(int id);

    List<Order> selectAllOrder();

    boolean deleteOrder(int id) throws SQLException;

    boolean updateOrder(Order order) throws SQLException;
}
