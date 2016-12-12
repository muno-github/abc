# 複数ホストで実行

## Step1 hostsファイルに複数ホストの設定をする

```
[vagrant]
vagrant1 ansible_ssh_host=127.0.0.1 ansible_ssh_port=2222
vagrant2 ansible_ssh_host=127.0.0.1 ansible_ssh_port=2200
vagrant3 ansible_ssh_host=127.0.0.1 ansible_ssh_port=2201
```

1台指定してping  

```sh
$ ansible vagrant2 -m "ping"
vagrant2 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

グループを指定してping  

```
ansible vagrant -m "ping"
vagrant3 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
vagrant2 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
vagrant1 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```


全ホストを指定してdate  

```sh
$ ansible all -a 'date'
vagrant2 | SUCCESS | rc=0 >>
2016年 12月 12日 月曜日 13:46:50 CET

vagrant3 | SUCCESS | rc=0 >>
2016年 12月 12日 月曜日 13:46:50 CET

vagrant1 | SUCCESS | rc=0 >>
2016年 12月 12日 月曜日 13:46:50 CET
```

