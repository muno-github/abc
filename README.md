Ansibleのサンプル

## SSHコマンド

```
$ ssh vagrant@127.0.0.1 -p 2222 -i ./.vagrant/machines/default/virtualbox/private_key
```

## 疎通確認

```sh
$ ansible testserver -i hosts -m ping
```
