CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_product`(
	IN `id` INT (20),
    IN `type`VARCHAR (100),
    IN `name`VARCHAR (100),
    IN `url_image` VARCHAR(255),
    IN `amount` INT (20),
    IN `price` DECIMAL (12,0),
    OUT message VARCHAR (255)
)
BEGIN
    IF (SELECT count(*) FROM products WHERE products.id = `id`) > 0
    THEN
        IF (SELECT count(*) FROM orderitem WHERE orderitem.productId = `id`) = 0
        THEN
            UPDATE products
            SET
                products.`type` = `type`,
                products.`name` = `name`,
                products.`url_image` = `url_image`,
                products.`amount` = `amount`,
                products.`price` = `price`
            WHERE products.id = id;
            SET message = "Cập nhật sản phẩm thành công!";
        ELSE
            SET message = "Sản phẩm này đã có trong danh sách đặt hàng không thể sửa!";
    END IF;
    ELSE
        SET message = "ID sản phẩm không tồn tại!";
    END IF;
END ;;