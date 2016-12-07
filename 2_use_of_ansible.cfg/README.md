# ansible.cfgによる簡略化

## Step1 ansible.cfgの解説

インベントリファイルにサーバ情報を全て記述すると見づらくなります。  
共通の設定情報(鍵やyユーザ名など)は、ansible.cfgに簡略に記述する事ができます。  

Ansibleは以下の順序でansible.cfgを参照する。  

```
1. 環境変数ANSIBLE_CONFIGに指定された場所
2. ./ansible.cnf カレントディレクトリ
3. ~/ansible.cnf ホームディレクトリ
4. /etc/ansible/ansible.cnf
```

## Step2 ansible.cfgを使用

カレントディレクトリにansible.cfgを作成する。  
ansibleコマンドで自動的にansible.cfgを読み込みにいくので、 -i host指定が不要になる。  

```sh
# ansible.cfgなし
$ ansible testserver -i host -m ping

# ansible.cfgあり
$ ansible testserver -m ping
```

## おまけ

-aオプションで、任意のコマンドを実行できる。  

```sh
$ ansible testserver -a uptime
testserver | SUCCESS | rc=0 >>
 17:25:10 up  1:40,  1 user,  load average: 0.00, 0.01, 0.05
 ```


実行したいコマンドにスペースが含まれる場合は、クォートで囲む必要がある。  

```sh
$ ansible testserver -a 'ls -la'
testserver | SUCCESS | rc=0 >>
合計 56
drwx------. 4 vagrant vagrant 4096 12月  7 15:18 .
drwxr-xr-x. 3 root    root      20  7月 16  2015 ..
```


-sオプションを付けることで、sudo実行される。  

```sh
$ ansible testserver -s -a 'ls -la'
```
