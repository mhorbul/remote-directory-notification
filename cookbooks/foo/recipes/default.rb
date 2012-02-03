#
# Cookbook Name:: foo
# Recipe:: default
#
# Copyright 2012, Max Horbul
#
# All rights reserved - Do Not Redistribute
#

execute "foo" do
  command "touch /tmp/foo.updated"
  action :nothing
end

file "/tmp/foo.updated" do
  action :delete
end

remote_directory "/tmp/foo" do
  source "foo"
  notifies :run, resources(:execute => "foo")
end
