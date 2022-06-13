package service;

import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Driver;
import utils.MySQLConnUtils;

public class ProductService implements IProductService{


    private static final MySQLConnUtils mySQLConnUtils = new MySQLConnUtils();

    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM products WHERE deleted = ?";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT type, name, url_image, amount, price, deleted FROM products WHERE id =?";

    private static final String CALL_UPDATE_PRODUCT_SQL = "{call sp_update_product(?, ?, ?, ?, ?, ?, ?)}";
    private static final String CALL_INSERT_PRODUCT_SQL = "{call sp_add_product(?, ?, ?, ?, ?, ?)}";

    private static final String CALL_DELETE_PRODUCT_SQL = "{call sp_delete_product(?, ?)}";

    @Override
    public String insertProduct(Product product) throws SQLException {
        try {
            Connection connection = mySQLConnUtils.getConnection();
            CallableStatement callableStatement = connection.prepareCall(CALL_INSERT_PRODUCT_SQL);

            callableStatement.setString(1, product.getType());
            callableStatement.setString(2, product.getName());
            callableStatement.setString(3,product.getImage());
            callableStatement.setInt(4, product.getAmount());
            callableStatement.setInt(5, product.getPrice());
            callableStatement.registerOutParameter(6, Types.VARCHAR);
            callableStatement.execute();
            return callableStatement.getString(6);

        }catch (SQLException e) {
            mySQLConnUtils.printSQLException(e);
        }
        return null;
    }

    @Override
    public Product selectProduct(int id) {
        Product product = null;
        try {
            Connection connection = mySQLConnUtils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String type = rs.getString("type");
                String name = rs.getString("name");
                String urlImage = rs.getString("url_image");
                int amount = Integer.parseInt(rs.getString("amount"));
                int price = Integer.parseInt(rs.getString("price"));
                boolean isDeleted = rs.getBoolean("deleted");
                product = new Product(id, type, name,urlImage, amount, price,isDeleted);
            }
        } catch (SQLException e) {
            mySQLConnUtils.printSQLException(e);
        }
        return product;
    }
    @Override
    public List<Product> selectAllProduct() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Product> products = new ArrayList<>();
        // Step 1: Establishing a Connection
        try {
            Connection connection = mySQLConnUtils.getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);
            preparedStatement.setInt(1, 0);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String type = rs.getString("type");
                String name = rs.getString("name");
                String urlImage = rs.getString("url_image");
                int amount = Integer.parseInt(rs.getString("amount"));
                int price = Integer.parseInt(rs.getString("price"));
                boolean deleted = rs.getBoolean("deleted");
                products.add(new Product(id, type, name,urlImage, amount,price,deleted));
            }
        } catch (SQLException e) {
            mySQLConnUtils.printSQLException(e);
        }
        return products;
    }

    @Override
    public String deleteProduct(int id) throws SQLException {
        try {
            Connection connection = mySQLConnUtils.getConnection();
            CallableStatement callableStatement = connection.prepareCall(CALL_DELETE_PRODUCT_SQL);

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
    public String updateProduct(Product product) throws SQLException {
        try {
            Connection connection = mySQLConnUtils.getConnection();
            CallableStatement callableStatement = connection.prepareCall(CALL_UPDATE_PRODUCT_SQL);

            callableStatement.setInt(1, product.getId());
            callableStatement.setString(2, product.getType());
            callableStatement.setString(3, product.getName());
            callableStatement.setString(4, product.getImage());
            callableStatement.setInt(5, product.getAmount());
            callableStatement.setInt(6, product.getPrice());
            callableStatement.registerOutParameter(7, Types.VARCHAR);
            callableStatement.execute();
            return callableStatement.getString(7);

        }catch (SQLException e) {
            mySQLConnUtils.printSQLException(e);
        }
        return null;
    }

    @Override
    public Product selectProductByName(String name) {
        return null;
    }


}
