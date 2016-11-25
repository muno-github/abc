# Ansibleのサンプル

## なぜ、Ansible?

手動でインフラを構築する手間を省ける。  
開発者とインフラチームで設定を共有できる。(DevOps)  

## 専門用語

### Playbook

ymlで書かれたインフラ構築手順。  

Playbookの実行  
```sh
$ ansible-playbook web.yml
```

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

すべてのホスト
```sh
ansible all -a 'date'
```

## playbook

準備: 80番と443番ポートが開いている必要がある。

Playbookの実行
```sh
$ ansible-playbook web-notls.yml
```

## Ansibleのモジュールドキュメント確認

```sh
$ ansible-doc file
$ ansible-doc service
```

## 参考

http://docs.ansible.com/  
http://docs.ansible.com/ansible/modules_by_category.html  
https://github.com/lorin/ansiblebook  
https://github.com/lorin/ansible-quickref  
https://gist.github.com/hamuhamu/ab37c70f579392f469a6f5576516801f  
[Ansible Galaxy サンプルコードはこちらで入手できる](https://galaxy.ansible.com/)  
