#
# Cookbook:: ais
# Recipe:: ldap_autofs_client
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Configure autofs to use an ldap server- does not configure ldap.conf

template '/etc/default/autofs' do
  source 'autofs.defaults.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    'master_map_name' => node['ais']['master_map_name'],
    'ldap_uri' => node['ais']['ldap_uri'],
    'search_base' => node['ais']['search_base'],
  )
end

template '/etc/default/autofs_ldap_auth.conf' do
  source 'autofs_ldap_auth.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
