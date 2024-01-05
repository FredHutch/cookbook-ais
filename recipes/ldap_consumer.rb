#
# Cookbook:: ais
# Recipe:: ldaps
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#
# install and configure openldap as a consumer for replication
# from a provider
#
package 'autofs-ldap' do
  action :install
end

node.override['openldap']['slapd_type'] = 'consumer'
node.override['openldap']['slapd_rid'] = \
  node['ais']['consumers'].find_index(node['hostname'])

include_recipe 'openldap::default'

# Override openldap cookbook template for slapd.conf
#  - our version removes limits for syncrepl bind
#  - also removes sorting of schemas
begin
  r = resources(template: "#{openldap_dir}/slapd.conf")
  r.cookbook 'ais'
  r.source 'openldap/slapd.conf.erb'
end
