#
# Cookbook:: ldap_server
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#
# Add LDAP entries
cookbook_file '/root/config.ldif' do
  source 'config.ldif'
  owner 'root'
  group 'root'
  mode '0600'
end

cookbook_file '/root/example.org.ldif' do
  source 'example.org.ldif'
  owner 'root'
  group 'root'
  mode '0600'
end

bash 'populate directory' do
  code <<-EREH
    systemctl stop slapd.service
    rm -rf /var/lib/ldap/*
    slapadd -F /etc/ldap/slapd.d -b dc=example,dc=org -l /root/example.org.ldif
    chown -R openldap:openldap /var/lib/ldap/
    systemctl start slapd.service
  EREH
end

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
