package 'vim-enhanced'
package 'nano'
package 'mc'

#node ['ipaddress']
#node ['memory']['total']
#node ['hostname']

package 'tree' do
  action :install
end

package 'ntp'
package 'git' do
  action :install
end

user 'user1' do
  comment 'user1'
  uid '123'
  home '/home/user1'
  shell '/bin/bash'
end  

group 'admins' do 
  members 'user1'
end

template '/etc/motd' do
  variables(
    :name => 'andrey') 
  source 'motd.erb'
  action :create
  owner 'root'
  group 'root'
end

service 'ntpd' do
  action [ :enable, :start ]
end

