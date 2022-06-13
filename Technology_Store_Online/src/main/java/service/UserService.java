package service;

import model.Product;
import model.Role;
import model.User;
import utils.MySQLConnUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService implements IUserService{

    private static final MySQLConnUtils mySQLConnUtils = new MySQLConnUtils();

    private static final String SELECT_ALL_USERS = "SELECT * FROM user";
    private static final String SELECT_USER_BY_ID = "SELECT id,username,password,name,phone,email,address,status,role FROM user WHERE id =?";

    private static final String CALL_UPDATE_PRODUCT_SQL = "{call sp_update_product(?, ?, ?, ?, ?, ?)}";
    private static final String CALL_INSERT_PRODUCT_SQL = "{call sp_add_product(?, ?, ?, ?, ?)}";

    private static final String CALL_BLOCK_USER_SQL = "{call sp_block_user(?, ?)}";
    @Override
    public boolean insertUser(User user) throws SQLException {
        return false;
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try {
            Connection connection = mySQLConnUtils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String userName = rs.getString("username");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String status = rs.getString("status");
                Role role = Role.fromValue(rs.getString("role"));
                user = new User(id, userName, password, name, phone, email , address, status ,role);
            }
        } catch (SQLException e) {
            mySQLConnUtils.printSQLException(e);
        }
        return user;
    }

    @Override
    public List<User> selectAllUser() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<User> users = new ArrayList<>();
        // Step 1: Establishing a Connection
        try {
            Connection connection = mySQLConnUtils.getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String userName = rs.getString("username");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String status = rs.getString("status");
                String roleStr = rs.getString("role");
                Role role = Role.fromValue(roleStr);

                users.add(new User(id,userName,password,name,phone,email,address,status,role));
            }
        } catch (SQLException e) {
            mySQLConnUtils.printSQLException(e);
        }
        return users;
    }

    @Override
    public String deleteUser(int id) throws SQLException {
        try {
            Connection connection = mySQLConnUtils.getConnection();
            CallableStatement callableStatement = connection.prepareCall(CALL_BLOCK_USER_SQL);

            callableStatement.setInt(1, id);
            callableStatement.registerOutParameter(2, Types.VARCHAR);
            callableStatement.execute();
            return callableStatement.getString(2);

        }catch (SQLException e) {
            mySQLConnUtils.printSQLException(e);
        }
        return null;
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
