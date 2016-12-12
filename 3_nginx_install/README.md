# NginxをVagrantで実行する

## Step1 webserversグループを作成


```sh
$ ansible webservers -m ping
testserver | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

## Step2 playbook作成

playbookはAnsibleでの設定管理のスクリプト。  
playbookはホストとタスクを結びつけるもの。  

handlersは、タスクから通知された際に実行される。  
通知はnotifyにて行う。  

以下の状態になった場合、notifyでhandlersに通知を送る必要がある。  

* 設定ファイルが変更された
* sites-enabledディレクトリの内容が変更された

ハンドラが実行されるのは、全てのタスク実行後であり通知が複数送られてきても１度しか実行しない。  

しかし、必ずサービスを再起動するようにいておいたほうが分かりやすい。  

## Step3 playbookの実行

```sh
$ ansible-playbook nginx.yml

PLAY [Configure webserver with nginx] ******************************************

TASK [setup] *******************************************************************
ok: [testserver]

TASK [copy nginx repo file] ****************************************************
ok: [testserver]

TASK [install nginx] ***********************************************************
ok: [testserver]

TASK [mkdir /etc/nginx/sites-available] ****************************************
ok: [testserver]

TASK [mkdir /etc/nginx/sites-enabled] ******************************************
ok: [testserver]

TASK [copy nginx config file] **************************************************
ok: [testserver]

TASK [enable configuration] ****************************************************
ok: [testserver]

TASK [copy index.html] *********************************************************
ok: [testserver]

TASK [disable firewalld] *******************************************************
changed: [testserver]

PLAY RECAP *********************************************************************
testserver                 : ok=9    changed=1    unreachable=0    failed=0
```
