# /srv/salt/test.sls
{% set services = ['foo','bar','gogo','salty','dev','merged'] %}
{% for service in services %}
{{ service }}:
  test.succeed_without_changes: []
{% endfor %}
