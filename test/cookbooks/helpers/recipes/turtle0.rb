#
# Cookbook:: helpers
# Recipe:: turtle0
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Install a turtle0 file for test kitchen

cookbook_file '/root/.turtle0' do
  owner 'root'
  group 'root'
  mode '0600'
  source 'turtle0.json'
end
