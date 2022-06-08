package service;

import model.OrderItem;

import java.sql.SQLException;
import java.util.List;

public interface IOrderItemService {
    boolean insertOrderItem(OrderItem orderItem) throws SQLException;

    OrderItem selectOrderItem(int id);

    List<OrderItem> selectAllOrderItem();

    boolean deleteOrderItem(int id) throws SQLException;

    boolean updateOrderItem(OrderItem orderItem) throws SQLException;
}
