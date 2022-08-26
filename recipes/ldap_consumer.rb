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
node.override['openldap']['slapd_rid'] = 1

include_recipe 'openldap::default'
