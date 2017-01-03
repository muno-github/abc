TMP_PASSWORD=$(cat /var/log/mysqld.log | grep 'password is generated'| awk -F'root@localhost: ' '{print $2}')

cat > /root/.tmp.my.cnf <<EOF
[client]
user=root
password=$TMP_PASSWORD
connect-expired-password
EOF
