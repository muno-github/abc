# playbook

playbookは、Ansibleでの設定管理のスクリプト。  

```sh
$ ansible webservers -m ping
testserver | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

```sh
$ ansible testserver -m ping
testserver | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

playbookはホストとタスクを結びつけるもの。  

