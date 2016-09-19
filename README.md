Ansibleのサンプル

## SSHコマンド

```
$ ssh vagrant@127.0.0.1 -p 2222 -i ./.vagrant/machines/default/virtualbox/private_key
```

## 疎通確認

testserver
```sh
$ ansible testserver -m ping
```

webserversグループ
```sh
$ ansible webservers -m ping
```

## playbook

準備: 80番と443番ポートが開いている必要がある。

Playbookの実行
```sh
$ ansible-playbook web-notls.yml
```

## 参考

https://github.com/lorin/ansiblebook
