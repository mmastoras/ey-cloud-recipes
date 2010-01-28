#
# Cookbook Name:: wkhtmltopdf
# Recipe:: default
#
if ['solo', 'app', 'app_master'].include?(node[:instance_role])
 
  # be sure to replace "app_name" with the name of your application.
  run_for_app('main_site', 'coney_island') do |app_name, data|
    
    bash "install-qt-webkit" do
      user "root"
      code "sudo -s;echo 'dev-haskell/x11 ~amd42 ~x86' >> /etc/portage/package.keywords/ec2;echo 'x11-libs/qt-gui ~amd42 ~x86' >> /etc/portage/package.keywords/ec2;echo 'x11-libs/qt-script ~amd42 ~x86' >> /etc/portage/package.keywords/ec2;echo 'x11-libs/qt-core ~amd42 ~x86' >> /etc/portage/package.keywords/ec2;echo 'x11-libs/qt3support ~amd42 ~x86' >> /etc/portage/package.keywords/ec2;echo 'x11-libs/qt-sql ~amd42 ~x86' >> /etc/portage/package.keywords/ec2;echo 'x11-libs/qt-webkit ~amd42 ~x86' >> /etc/portage/package.keywords/ec2;emerge x11;emerge x11-libs/qt-webkit;exit"
    end
  end
 
end
