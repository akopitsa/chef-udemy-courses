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

