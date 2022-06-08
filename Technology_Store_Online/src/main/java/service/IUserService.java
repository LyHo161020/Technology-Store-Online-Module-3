package service;

import model.Product;
import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    boolean insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUser();

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    User selectUserByName(String name);
}
