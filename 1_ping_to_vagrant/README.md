# ansibleコマンドでpingする

## Step1 手動によるsshを確認する

Ansibleを実行するためには、vagrant sshではなく通常のsshで接続しなければならない。  
その為、sshコマンドでvagrantに接続する。  

```sh
$ vagrant up
# まずは、vagrantコマンドでsshできるか確認
$ vagrant ssh
```

vagrantのssh情報を取得  
```sh
$ vagrant ssh-config
Host default
  HostName 127.0.0.1
  User vagrant
  Port 2200
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /Users/hamuhamu/.vagrant.d/insecure_private_key
  IdentitiesOnly yes
  LogLevel FATAL
```

```sh
$ ssh vagrant@127.0.0.1 -p 2200 -i /Users/hamuhamu/.vagrant.d/insecure_private_key
```

## Step2 インベントリファイル作成

Ansibleは管理対象のホストをインベントリファイルというファイルで管理する。  

イベントリファイルの場所 playbooks/hosts  

```
└── playbooks
    └── hosts
```

インベントリファイルに先程のssh接続情報を書き込む。  

## Step3 ansibleコマンド実行

```sh
$ ansible testserver -i playbooks/hosts -m ping

testserver | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

changed: falseはサーバの状態が変更しなかったことを表している。  
