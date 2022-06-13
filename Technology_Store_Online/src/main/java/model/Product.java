package model;

import java.util.Objects;

public class Product implements Comparable<Product> {
    private int id;
    private String type;
    private String name;

    private String image;
    private int amount;
    private int price;
    private boolean deleted;

    public Product(){
    }

    public Product(int id, String type, String name, int amount, int price, boolean deleted) {
        this.id = id;
        this.type = type;
        this.name = name;
        this.amount = amount;
        this.price = price;
        this.deleted = deleted;
    }

    public Product(int id, String type, String name,String urlImage, int amount, int price) {
        this.id = id;
        this.type = type;
        this.name = name;
        this.image = urlImage;
        this.amount = amount;
        this.price = price;
    }

    public Product(String type, String name, String urlImage, int amount, int price) {
        this.type = type;
        this.name = name;
        this.image = urlImage;
        this.amount = amount;
        this.price = price;
    }

    public Product(int id, String type, String name, String urlImage, int amount, int price, boolean deleted) {
        this.id = id;
        this.type = type;
        this.name = name;
        this.image = urlImage;
        this.amount = amount;
        this.price = price;
        this.deleted = deleted;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }


    @Override
    public String toString() {
        return id + "," + type + "," + name + "," + "," + image + amount + "," + price + "," + deleted;
    }

    @Override
    public int compareTo(Product o) {
        if(price - o.price == 0){
            if(amount - o.amount == 0){
                return name.compareTo(o.name);
            }else{
                return amount - o.amount;
            }
        }
        return price - o.price;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return id == product.id && amount == product.amount && price == product.price && Objects.equals(name, product.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, amount, price);
    }
}
