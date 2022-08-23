node.default['ais']['master_map_name'] = '/etc/auto.master'
# use this form if using auto.master from LDAP instead of /etc:
# node.default['ais']['master_map_name'] = \
#   'ou=auto.master,ou=automount,ou=ais,dc=example,dc=org'
node.default['ais']['ldap_uri'] = 'ldap://127.0.0.1'
node.default['ais']['search_base'] = 'ou=automount,ou=ais,dc=example,dc=org'

# This is a password for TESTING ONLY.  It's "letmein"
node.default['openldap']['rootpw'] = \
  '{SSHA}BKUwewI6N9Yat00Aoxn/nNUEq78ifdif'
node.default['openldap']['server'] = 'ldap.example.org'
node.default['openldap']['basedn'] = 'dc=example,dc=org'
node.default['openldap']['cn'] = 'admin'
node.default['openldap']['admin_cn'] = 'administrators'

# Required
#
node.default['openldap']['schemas'] = %w(
  core.schema
  cosine.schema
  inetorgperson.schema
  nis.schema
  autofs.schema
)
