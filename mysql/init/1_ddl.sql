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

GRANT ALL PRIVILEGES ON freeeeren TO ren;