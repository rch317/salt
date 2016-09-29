# /srv/salt/newtest.sls
{% set services = ['new','test','prtest'] %}
{% for service in services %}
{{ service }}:
  test.succeed_with_changes: []
{% endfor %}
