#
# Cookbook:: ldap_server
# Recipe:: populate_directory
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
