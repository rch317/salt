# /srv/salt/test.sls
{% set services = ['foo','bar','gogo'] %}
{% for service in services %}
{{ service }}:
  test.succeed_without_changes: []
{% endfor %}