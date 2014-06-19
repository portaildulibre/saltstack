openstack-keystone:
  pkg:
    - installed

python-keystoneclient:
  pkg:
    - installed

/etc/keystone.conf:
  file:
    - managed
    - source: salt://icehouse/openstack/keystone/files/keystone.conf
    - require: 
      - pkg: openstack-keystone
