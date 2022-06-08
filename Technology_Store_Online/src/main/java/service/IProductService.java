package service;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductService {
    boolean insertProduct(Product product) throws SQLException;

    Product selectProduct(int id);

    List<Product> selectAllProduct();

    boolean deleteProduct(int id) throws SQLException;

    String updateProduct(Product product) throws SQLException;

    Product selectProductByName(String name);
}
