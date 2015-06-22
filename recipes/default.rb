#
# Cookbook Name:: messaging_server
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "chef-zeromq"
include_recipe "chef-ruby"

["ffi", "ffi-rzmq", "zmqmachine"].each do |gem|
  gem_package gem do
    action :install
  end
end