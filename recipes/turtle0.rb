#
# Cookbook:: ais
# Recipe:: turtle0
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#
# this recipe reads secrets from a file stored on the node.  The first
# secrets, or "turtle zero", the turtle at the bottom of the pile
#  with apologies to D. Somerfield https://danielsomerfield.github.io/turtles/

require 'json'

ruby_block 'load turtle0' do
  block do
    turtle0 = IO.read(node['turtle0']['path'])
    secrets = JSON.parse(turtle0)
    node.override['openldap']['rootpw'] = secrets['openldap']['rootpw']
    node.override['openldap']['slapd_replpw'] = secrets['openldap']['slapd_replpw']
  end
  sensitive true
end

