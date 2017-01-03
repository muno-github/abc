NEW_PASS='MyNewPass4@'
mysql --defaults-file=/root/.tmp.my.cnf -e "ALTER USER 'root'@'localhost' IDENTIFIED BY  '$NEW_PASS' "

cat > /root/.my.cnf <<EOF
[client]
user=root
password=$NEW_PASS
EOF
