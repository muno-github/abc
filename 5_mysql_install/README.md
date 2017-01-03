# MySQL5.7のインストールしユーザを作成する

MySQLのインストールとユーザの作成まで。  

## Step1 MySQL5.7インストール

```sh
$ ansible-playbook mysql.yml
```

## Step2 MySQLのユーザを作成

```sh
$ ansible-playbook mysql_user.yml

PLAY [MySQLのユーザを作る] ************************************************************

TASK [setup] *******************************************************************
ok: [mysql_1]

TASK [copy mysql config file] **************************************************
ok: [mysql_1]

TASK [restart MySQL] ***********************************************************
changed: [mysql_1]

TASK [rootの一時パスワードを取り出し] *******************************************************
skipping: [mysql_1]

TASK [rootのパスワードを変更] ***********************************************************
skipping: [mysql_1]

TASK [create mysql hoge user] **************************************************
ok: [mysql_1] => (item=localhost)
ok: [mysql_1] => (item=127.0.0.1)

PLAY RECAP *********************************************************************
mysql_1                    : ok=4    changed=1    unreachable=0    failed=0
```

ゲストOSから確認ユーザが作成されたか確認する。  

```sh
$ mysql -u root -pMyNewPass4@

mysql> SELECT user, host FROM mysql.user;
+-----------+-----------+
| user      | host      |
+-----------+-----------+
| hoge      | 127.0.0.1 |
| hoge      | localhost |
| mysql.sys | localhost |
| root      | localhost |
+-----------+-----------+
4 rows in set (0.00 sec)

mysql> SHOW GRANTS FOR hoge@localhost;
+---------------------------------------------------------+
| Grants for hoge@localhost                               |
+---------------------------------------------------------+
| GRANT USAGE ON *.* TO 'hoge'@'localhost'                |
| GRANT ALL PRIVILEGES ON `mysql`.* TO 'hoge'@'localhost' |
+---------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> SHOW GRANTS FOR hoge@127.0.0.1;
+---------------------------------------------------------+
| Grants for hoge@127.0.0.1                               |
+---------------------------------------------------------+
| GRANT USAGE ON *.* TO 'hoge'@'127.0.0.1'                |
| GRANT ALL PRIVILEGES ON `mysql`.* TO 'hoge'@'127.0.0.1' |
+---------------------------------------------------------+
2 rows in set (0.00 sec)
```
