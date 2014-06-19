base:
  'sun': #controller
    - icehouse.common.network.controller
    - icehouse.common.ntp
    - icehouse.common.RDO-formula
    - icehouse.common.qpid
#    - icehouse.openstack.mysql
#    - icehouse.openstack.keystone
#    - icehouse.openstack.mysql.databases

  'mars': #compute
    - icehouse.common.network.compute
    - icehouse.common.ntp
    - icehouse.common.RDO-formula
    - icehouse.common.qpid

  'pluto': #network
    - icehouse.common.network.network
    - icehouse.common.ntp
    - icehouse.common.RDO-formula
    - icehouse.common.qpid

