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

include_recipe 'openldap::default'
