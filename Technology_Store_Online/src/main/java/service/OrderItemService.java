package service;

import model.OrderItem;

import java.sql.SQLException;
import java.util.List;

public class OrderItemService implements IOrderItemService{
    @Override
    public boolean insertOrderItem(OrderItem orderItem) throws SQLException {
        return false;
    }

    @Override
    public OrderItem selectOrderItem(int id) {
        return null;
    }

    @Override
    public List<OrderItem> selectAllOrderItem() {
        return null;
    }

    @Override
    public boolean deleteOrderItem(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateOrderItem(OrderItem orderItem) throws SQLException {
        return false;
    }
}
