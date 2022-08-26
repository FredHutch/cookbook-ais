#
# Cookbook:: ais
# Recipe:: ldaps
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#
# install and configure openldap server to serve automount info
package 'autofs-ldap' do
  action :install
end

node.override['openldap']['slapd_type'] = 'provider'

include_recipe 'openldap::default'
