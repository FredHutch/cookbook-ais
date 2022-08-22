#
# Cookbook:: ais
# Recipe:: ldaps
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#
# install and configure openldap server to serve automount info
include_recipe 'openldap::default'

package 'autofs-ldap' do
  action :install
end
