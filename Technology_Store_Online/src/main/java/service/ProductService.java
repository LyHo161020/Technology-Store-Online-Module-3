package service;

import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Driver;

public class ProductService implements IProductService{


    private String jdbcURL = "jdbc:mysql://localhost:3306/product_management";
    private String jdbcUsername = "root";
    private String jdbcPassword = "25251325";

    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM product";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT id,type,name,amount,price FROM product WHERE id =?";

    private static final String CALL_UPDATE_PRODUCT_SQL = "{call sp_update_product(?, ?, ?, ?, ?, ?)}";
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public boolean insertProduct(Product product) throws SQLException {
        return false;
    }

    @Override
    public Product selectProduct(int id) {
        Product product = null;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String type = rs.getString("type");
                String name = rs.getString("name");
                int amount = Integer.parseInt(rs.getString("amount"));
                int price = Integer.parseInt(rs.getString("price"));
                product = new Product(id, type, name, amount, price);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
    }
    @Override
    public List<Product> selectAllProduct() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Product> products = new ArrayList<>();
        // Step 1: Establishing a Connection
        try {
            Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String type = rs.getString("type");
                String name = rs.getString("name");
                int amount = Integer.parseInt(rs.getString("amount"));
                int price = Integer.parseInt(rs.getString("price"));
//                long balance = Long.parseLong(rs.getString("balance"));
                products.add(new Product(id, type, name, amount,price));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        return false;
    }

    @Override
    public String updateProduct(Product product) throws SQLException {
        try {
            Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(CALL_UPDATE_PRODUCT_SQL);

            callableStatement.setInt(1, product.getId());
            callableStatement.setString(2, product.getType());
            callableStatement.setString(3, product.getName());
            callableStatement.setInt(4, product.getAmount());
            callableStatement.setInt(5, product.getPrice());
            callableStatement.registerOutParameter(6, Types.VARCHAR);
            callableStatement.execute();
            return callableStatement.getString(4);

        }catch (SQLException e) {
            printSQLException(e);
        }
        return null;
    }

    @Override
    public Product selectProductByName(String name) {
        return null;
    }

    public void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
