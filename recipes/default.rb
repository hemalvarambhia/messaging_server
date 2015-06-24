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

package "libsqlite3-dev" do
 action :install
end

package "git" do
 action :install
end

remote_file "mongrel2-v1.9.1.tar.gz" do
 source "https://github.com/zedshaw/mongrel2/releases/download/v1.9.1/mongrel2-v1.9.1.tar.gz"
 action :create
end

execute "unpack-mongrel2" do
 command "tar -xzf mongrel2-v1.9.1.tar.gz -C /usr/local/src/"
 action :run
end

execute "build-mongrel2" do
 command "make clean all && sudo make install"
 cwd "mongrel2-v1.9.1"
 action :run
end

package "uuid-runtime" do
 action :install
end

["rbczmq", "zmqmachine"].each do |gem|
  gem_package gem do
    action :install
  end
end