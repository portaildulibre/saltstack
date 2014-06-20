include:
  - icehouse.common.MySQL-python
mysql:
  pkg:
    - installed

mysql-server:
  pkg:
    - installed
  service:
    - name: mysqld
    - running
    - enable: True
    - require:
      - pkg: mysql-server
  mysql_user:
    - present
    - name: root
    - password: password
    - require:
      - service: mysqld 

/etc/my.cnf:
  file:
    - managed
    - source: salt://icehouse/openstack/mysql/files/my.cnf
    - require:
      - pkg: mysql-server

