#
# Cookbook Name:: openstack-common
# Recipe:: read_databag
#
# Copyright (C) 2014 Springer
# 

class ::Chef::Recipe
  include ::Openstack
end

environment = node['openstack']['environment']
configuration = data_bag_item(node['openstack']['data_bag'], node['openstack']['bag_config'])
begin
  configuration = configuration[environment]
  set_from_hash(node.default['openstack'], configuration)
rescue
  Chef::Application.fatal!('Something was wrong while processing data_bag!', 1)
end

