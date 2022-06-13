CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_product`(
	IN `id` INT (20),
    OUT message VARCHAR (255)
)
BEGIN
    IF (SELECT count(*) FROM products WHERE products.`id` = `id`) > 0
    THEN
        IF (SELECT count(*) FROM orderitem WHERE orderitem.productId = `id`) > 0
            THEN
            SET message = "Sản phẩm này đã có trong danh sách order không thể xoá!";
        ELSE
            UPDATE  products
            SET products.`deleted` = 1
            WHERE products.id = `id`;
            SET message = "Xóa sản phẩm thành công!";
            END IF;
    ELSE
        SET message = "ID sản phẩm không tồn tại!";
    END IF;
END ;;