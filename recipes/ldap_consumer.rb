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
log 'rid debug' do
  message "ais consumers contains #{node['ais']['consumers']} vs #{node['hostname']}"
end
include_recipe 'openldap::default'
