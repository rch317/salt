# /srv/salt/test.sls
{% set services = ['foo','bar','gogo','salty','dev'] %}
{% for service in services %}
{{ service }}:
  test.succeed_without_changes: []
{% endfor %}
