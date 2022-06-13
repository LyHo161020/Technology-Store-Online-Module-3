CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_user`(
	IN `id` INT (20),
    OUT message VARCHAR (255)
)
BEGIN
    IF (SELECT count(*) FROM `user` WHERE `user`.`id` = `id`) > 0
    THEN
        IF (SELECT count(*) FROM orderitem WHERE orderitem.userId = `id`) > 0
            THEN
            SET message = "Người dùng này đang có đơn hàng không thể xoá!";
        ELSE
            UPDATE `user`
            SET `user`.`status` = "block"
            WHERE `user`.`id` = `id`;
            SET message = "Xóa người dùng thành công!";
            END IF;
    ELSE
                SET message = "ID người dùng không tồn tại!";
    END IF;
END ;;