-- +migrate Up
ALTER TABLE users ADD COLUMN last varchar(10);

-- +migrate Down
ALTER TABLE users DROP COLUMN last;
