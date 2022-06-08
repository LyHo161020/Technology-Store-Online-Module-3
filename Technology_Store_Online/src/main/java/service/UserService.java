package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService{
    @Override
    public boolean insertUser(User user) throws SQLException {
        return false;
    }

    @Override
    public User selectUser(int id) {
        return null;
    }

    @Override
    public List<User> selectAllUser() {
        return null;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return false;
    }

    @Override
    public User selectUserByName(String name) {
        return null;
    }
}
