# 

## Step1 

```sh
$ ansible vagrant2 -m "ping"
vagrant2 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

hostsファイルのホスト名やポートといった変数は振る舞い型のインベントリパラメタ(behavior inventory parameter)という。  

```sh
$ ansible all -a 'date'
vagrant2 | SUCCESS | rc=0 >>
2016年 12月 12日 月曜日 13:46:50 CET

vagrant3 | SUCCESS | rc=0 >>
2016年 12月 12日 月曜日 13:46:50 CET

vagrant1 | SUCCESS | rc=0 >>
2016年 12月 12日 月曜日 13:46:50 CET
```


