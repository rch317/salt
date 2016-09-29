# SaltStack Lab

*A collection of salt states being used in my saltstack lab.*

### Salt nodes
- master:  172.16.13.227
  * aue3dpocdb01:  172.16.8.61

### Useful salt notes:
```sh
$ salt 'host' cp.list_states
$ salt '*' saltutil.clear_cache
```

### Putting jinja to work in your states...
~~~~

{% load_yaml as osmap %}
  Debian:
    pkgs:
      - redis-server
      - python-redis
    service: redis-server
    conf: /etc/redis/redis.conf
  RedHat:
    pkgs:
      - redis
      - python-redis
    service: redis
    conf: /etc/redis.conf
{% endload %}

{% set redis = salt['grains.filter_by'](osmap) %}

redis_install:
  pkg.latest:
    - pkgs:
    {% for pkg in redis.pkgs %}
      - {{pkg}}
    {% endfor %}

redis_server:
  service.running:
    - enable: True
    - name: {{redis.service}}
    - require:
      - pkg: redis_install

redis_conf:
  file.managed:
    - source: salt://redis/files/redis.conf.jinja
    - name: {{redis.conf}}
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja
    - redis_bind: {{salt['pillar.get']('redis:bind')}}
    - redis_port: {{salt['pillar.get']('redis:port')}}
    - redis_dir: {{salt['pillar.get']('redis:root_dir')}}
    - require:
      - pkg: redis_install
    - watch_in:
      - service.redis_service
~~~~