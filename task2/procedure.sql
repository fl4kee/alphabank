DELIMITER //
CREATE PROCEDURE showCredits()
BEGIN
# Объявляю переменные и курсор
DECLARE finished INT DEFAULT 0;
DECLARE docdate_c DATE;
DECLARE caption_c VARCHAR(10);
DECLARE remainder INT;
DECLARE user_id_c INT;
DECLARE user_count INT;
DECLARE amount_c INT;
DECLARE val_c INT;
DECLARE user_data CURSOR FOR
SELECT users.id, amount, val, docdate, caption FROM credits
JOIN users ON user_id = users.id 
ORDER BY user_id, docdate DESC;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

OPEN user_data;
# Чистим таблицу
DELETE FROM alpha;
# Счетчик пользователей 
SET user_count = 1;

outer_loop: LOOP 
    FETCH user_data INTO user_id_c, amount_c, val_c, docdate_c, caption_c;
    IF finished = 1 THEN 
        LEAVE outer_loop;
    END IF;
        IF user_count = user_id_c THEN
            SET remainder = val_c;
            # Во внутреннем цикле проход по одному пользователю
            inner_loop: LOOP
                IF amount_c < remainder THEN
                    INSERT INTO alpha(user_id, docdate, remainder, caption) VALUES(user_id_c, docdate_c, amount_c, caption_c);
                    SET remainder = remainder - amount_c;
                    FETCH user_data INTO user_id_c, amount_c, val_c, docdate_c, caption_c;
                ELSE 
                    INSERT INTO alpha(user_id, docdate, remainder, caption) VALUES(user_id_c, docdate_c, remainder, caption_c);
                    SET user_count = user_count + 1;
                    LEAVE inner_loop;
                END IF;
            END LOOP;
        END IF;
END LOOP;
CLOSE user_data;

SELECT * FROM alpha;
END //
DELIMITER ;



