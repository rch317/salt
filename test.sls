# /srv/salt/test.sls
this_is_a_test:
  test.succeed_without_changes:
    - name: foo