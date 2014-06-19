include:
  - icehouse.common.MySQL-python
  - icehouse.openstack.mysql

{% for service in ("keystone", "glance", "nova", "cinder", "ceilometer", "neutron", "heat", "dash") %}
mysql_{{ service }}:
  mysql_database:
    - present
    - name: {{ service }}
    - connection_user: root
    - connection_pass: password
    - require:
      - service: mysqld
  mysql_user:
    - present
    - password: {{ service }}
    - name: {{ service }}
    - connection_user: root
    - connection_pass: password
    - require:
      - service: mysqld
  mysql_grants:
    - present
    - grant: all privileges
    - database: {{ service }}.*
    - hosts:
      - localhost
      - "%"
    - user: {{ service }}
    - name: {{ service }}
    - connection_user: root
    - connection_pass: password
    - require:
      - mysql_database: mysql_{{ service }}
      - mysql_user: mysql_{{ service }}
      - service: mysqld
  cmd.run:
      - name: su -s /bin/sh -c "{{ service }}-manage db_sync"  {{ service }}
      - watch:
        - mysql_database: {{ service }}

{% endfor %}

