ntp:
  pkg:
    - installed
  service:
    - name: ntpd
    - running
    - enable: True
