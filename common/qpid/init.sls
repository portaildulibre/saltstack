qpid-cpp-server:
  pkg:
    - installed
  service:
    - name: qpidd
    - running
    - enable: True
    - require:
      - pkg: qpid-cpp-server

/etc/qpidd.conf:
  file:
    - managed
    - source: salt://icehouse/common/qpid/files/qpidd.conf
    - require:
      - pkg: qpid-cpp-server

