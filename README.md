### [sql-migrate](https://github.com/rubenv/sql-migrate)
install 
```sh
$ go get -v github.com/rubenv/sql-migrate/...
```


### .env のセットアップ
```sh
$ direnv edit .
$ direnv allow
```

### DB セットアップ
``` sh
$ docker-compose up -d
```
```sh
$ docker ps 
CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS          PORTS                               NAMES
1e5454efe3fb   mysql:5.7   "docker-entrypoint.s…"   51 seconds ago   Up 50 seconds   0.0.0.0:3306->3306/tcp, 33060/tcp   sql_migrate-
```

### sql migration
```
$ sql-migrate new create_users
```
up
```sh
$ sql-migrate up 
```
down (バージョンを下げる)
```sh
$ sql-migrate down
```


### mysql  操作
docker の中に入る
```sh
$ docker exec -it 1e5454efe3fb  bash

bash-4.2#  mysql -u root -p --host 127.0.0.1
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 29
```

dbの作成
```sh
mysql> create database sql_migrate_dev;
mysql> create database sql_migrate_stg;
```

dbの選択
```sh
 mysql> use sql_migrate_dev
```

テーブルの確認
```sh
 mysql> show tables;
```

環境の切り分け
```sh
 $ sql-migrate up -env="staging"
 Applied 3 migrations

 $ sql-migrate status -env="staging"
+--------------------------------------+-------------------------------+
|              MIGRATION               |            APPLIED            |
+--------------------------------------+-------------------------------+
| 20240405115013-create_users.sql      | 2024-04-05 03:59:46 +0000 UTC |
| 20240405125616-add_name_to_users.sql | 2024-04-05 04:00:16 +0000 UTC |
| 20240405125622-add_age_to_users.sql  | 2024-04-05 04:00:16 +0000 UTC |
+--------------------------------------+-------------------------------+
mysql> use sql_migrate_stg #  dbnの切り替え


mysql> show columns from users;
+-------+--------------+------+-----+---------+----------------+
| Field | Type         | Null | Key | Default | Extra          |
+-------+--------------+------+-----+---------+----------------+
| id    | int(11)      | NO   | PRI | NULL    | auto_increment |
| name  | varchar(100) | YES  |     | NULL    |                |
| last  | varchar(10)  | YES  |     | NULL    |                |
| age   | int(11)      | YES  |     | NULL    |                |
+-------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)
 ```sh
