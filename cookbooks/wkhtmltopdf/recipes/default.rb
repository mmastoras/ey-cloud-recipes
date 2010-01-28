#
# Cookbook Name:: wkhtmltopdf
# Recipe:: default
#
if ['solo', 'app', 'app_master'].include?(node[:instance_role])
 
  # be sure to replace "app_name" with the name of your application.
  run_for_app('main_site_staging', 'coney_island') do |app_name, data|
    
    bash "unmask-qt-webkit" do
      user "root"
      code "sudo echo 'x11-libs/qt-webkit ~amd64 ~x86' >> /etc/portage/package.keywords/ec2"
    end

    bash "install-qt-webkit" do
      user "root"
      code "sudo apt-get libqt4-webkit"
    end
  end
 
end
