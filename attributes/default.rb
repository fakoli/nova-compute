

default[:openstack][:cloudcontroller] = "10.33.170.8"
default[:openstack][:nova][:self] = node["ip_address"]

#Nova
default[:openstack][:nova][:url] ="http://#{node[:openstack][:cloudcontroller]}:8774/v1.1"
default[:openstack][:nova][:service_user] = "nova"
default[:openstack][:nova][:service_pass] = "nova"

#Novnc
default[:openstack][:novnc][:url] = "http://#{node[:openstack][:cloudcontroller]}:6080/vnc_auto.html" 

#quantum
default[:openstack][:quantum][:url] ="http://#{node[:openstack][:cloudcontroller]}:9696"
default[:openstack][:quantum][:admin_url] ="http://#{node[:openstack][:cloudcontroller]}:35357/v2.0"
default[:openstack][:quantum][:service_user] = "quantum"
default[:openstack][:quantum][:service_pass] = "quantum"

#Messaging
default[:openstack][:messaging][:type] = "qpid"
default[:openstack][:messaging][:address] = "#{node[:openstack][:cloudcontroller]}"

#KeyStone
default[:openstack][:keystone][:auth_host] = "#{node[:openstack][:cloudcontroller]}"
default[:openstack][:keystone][:auth_port] = "35357"

#Glance 
default[:openstack][:glance][:api] ="#{node[:openstack][:cloudcontroller]}:9292"

# Third Party API
default[:openstack][:s3_host][:host] = "#{node[:openstack][:cloudcontroller]}"
default[:openstack][:ec2_dmz][:host] = "#{node[:openstack][:cloudcontroller]}"

# Database Options
default[:openstack][:db][:mode] = "dev"
default[:openstack][:db][:type] = "mysql"
default[:openstack][:db][:user] = "nova"
default[:openstack][:db][:pass] = "access4nova"
default[:openstack][:db][:conn] = "#{node[:openstack][:db][:type]}://#{node[:openstack][:db][:user]}:#{node[:openstack][:db][:pass]}@#{node[:openstack][:cloudcontroller]}/nova"

