CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_product`(
	IN `type` VARCHAR (255),
    IN `name` VARCHAR (255),
    IN `url_image` VARCHAR(255),
    IN `amount` INT (20),
    IN `price` DECIMAL (12,0),
    OUT message VARCHAR (255)
)
BEGIN
    IF (SELECT count(*) FROM products WHERE products.`name` = `name`) > 0
    THEN
        SET message = "Sản phẩm đã tồn tại!";
    ELSE
            INSERT INTO products (
                        `type`,
                        `name`,
                        `url_image`,
                        `amount`,
                        `price`
                        )
            VALUES (
                        `type`,
                        `name`,
                        `url_image`,
                        `amount` ,
                        `price`);
            SET message = "Thêm sản phẩm thành công!";
    END IF;
END ;;