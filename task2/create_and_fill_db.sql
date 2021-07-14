CREATE DATABASE IF NOT EXISTS alphabank;
USE alphabank;
CREATE TABLE IF NOT EXISTS users(id INT PRIMARY KEY AUTO_INCREMENT, val INT);
CREATE TABLE IF NOT EXISTS credits(amount INT, 
                                   docdate DATETIME, 
                                   caption VARCHAR(6), 
                                   user_id INT, 
                                   FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE);
CREATE TABLE IF NOT EXISTS result(
    user_id INT,
    docdate DATETIME,
    remainder INT,
    caption VARCHAR(10),
    FOREIGN KEY(user_id) REFERENCES credits(user_id) ON DELETE CASCADE
);

INSERT INTO users(val) VALUES(24),(13),(2),(5);

INSERT INTO credits(user_id, amount, docdate, caption)
VALUES (1, 5, '20051024', "qh"),
       (1, 9, "20051019", "wj"),
       (1, 3, "20051022", "ek"),
       (1, 8, "20051004", "rl"),
       (1, 6, "20051018", "tz"),
       (1, 5, "20050929", "yx"),
       (2, 11, "20051023", "uc"),
       (2, 6, "20051021", "iv"),
       (2, 45, "20051018", "ob"),
       (3, 4, "20051030", "pn"),
       (3, 2, "20051028", "am"),
       (4, 4, "20051021", "sq"),
       (4, 6, "20051023", "dw"),
       (4, 8, "20051023", "fe"),
       (4, 9, "20051023", "gr");
