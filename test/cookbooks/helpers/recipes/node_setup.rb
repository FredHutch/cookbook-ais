#
# Cookbook:: ldap_server
# Recipe:: node_setup
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#
# Create virtual home directories and users
directory '/export/home' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

user 'bob' do
  comment 'sample user bob'
  uid 10001
  gid 100
  home '/homes/bob'
  manage_home false
  username 'bob'
end

directory '/export/home/bob' do
  owner 'bob'
  group 'users'
  mode '0755'
  recursive true
end

user 'alice' do
  comment 'sample user alice'
  uid 10002
  gid 100
  home '/homes/alice'
  manage_home false
  username 'alice'
end

directory '/export/home/alice' do
  owner 'alice'
  group 'users'
  mode '0755'
  recursive true
end

service 'autofs' do
  action :nothing
end

cookbook_file '/etc/auto.master' do
  owner 'root'
  group 'root'
  mode '0644'
  source 'auto.master'
  notifies :restart, 'service[autofs]', :immediately
end
