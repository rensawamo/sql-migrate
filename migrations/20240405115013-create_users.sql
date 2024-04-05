-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE users (
  id INT AUTO_INCREMENT,
  name VARCHAR(100),
  PRIMARY KEY (id)
);

-- +migrate Down
-- SQL in section 'Down' is executed when this migration is rolled back
DROP TABLE users;
