package service;

import model.Order;

import java.sql.SQLException;
import java.util.List;

public class OrderService implements IOrderService{
    @Override
    public boolean insertOrder(Order order) throws SQLException {
        return false;
    }

    @Override
    public Order selectOrder(int id) {
        return null;
    }

    @Override
    public List<Order> selectAllOrder() {
        return null;
    }

    @Override
    public boolean deleteOrder(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateOrder(Order order) throws SQLException {
        return false;
    }
}
