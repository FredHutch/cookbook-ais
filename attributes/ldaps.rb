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
