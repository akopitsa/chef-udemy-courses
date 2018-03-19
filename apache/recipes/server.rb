#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#

package 'httpd' do
  action :install
end

#cookbook_file '/var/www/html/index.html' do
#  source 'index.html'
#end

#remote_file '/var/www/html/robin.png' do
#  source 'https://i0.wp.com/freepngimages.com/wp-content/uploads/2016/10/robin-redbreast-perching.png' 
#end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

bash "inline script" do
  user "root"
  code "mkdir -p /var/www/mysites/ && chown -R apache /var/www/mysites/"
  no_if  '[ -d /var/www/mysites/ ]'
#  only_if
#  not_if do
#    File.directory?('/var/www/mysites/')
#  end
end

#execute "run script" do 
#  user "root"
#  command <<-EOH
#  mkdir -p /var/www/mysites/
#  chown -R apache /var/www/mysites/
#  EOH
#  not_if
#end

directory "/var/www/mysites/" do 
  owner 'apache'
  recursive true
  mode 0755
end


service 'httpd' do
  action [ :enable, :start]
end

