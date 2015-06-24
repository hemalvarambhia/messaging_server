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

package "mongrel2-run" do
 action :install
end

["rbczmq", "zmqmachine"].each do |gem|
  gem_package gem do
    action :install
  end
end