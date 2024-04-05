CREATE USER 'ren'@'%'          IDENTIFIED BY 'freren';
DROP SCHEMA IF EXISTS freeeeren;
CREATE DATABASE IF NOT EXISTS freeeeren;
USE freeeeren;

DROP TABLE IF EXISTS felun;
CREATE TABLE felun
(
  id           INT(10),
  name     VARCHAR(40)
);

GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY ${MYSQL_ROOT_PASSWORD};
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY ${MYSQL_ROOT_PASSWORD};

FLUSH PRIVILEGES;
