-- +migrate Up
ALTER TABLE users ADD COLUMN age int;

-- +migrate Down
ALTER TABLE users DROP COLUMN age;
