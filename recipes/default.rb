#
# Cookbook Name:: nova-compute
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "repos::openstack"

service "libvirtd" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

package "openstack-nova-compute" do
  action :install
end

template "/etc/nova/nova.conf" do
  source "nova.conf.erb"
  owner "root"
  group "root"
  mode 00644
end

template "/etc/nova/api-paste.ini" do
  source "api-paste.ini.erb"
  owner "root"
  group "root"
  mode 00644
end

template "/etc/nova/nova-compute.conf" do
  source "nova-compute.conf.erb"
  owner "root"
  group "root"
  mode 00644
end

service "openstack-nova-compute" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :restart ]
end

