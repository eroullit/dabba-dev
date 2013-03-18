# Install dependencies
%w{build-essential git cmake python-yaml indent libprotobuf-c0-dev protobuf-c-compiler libnl-3-dev libnl-genl-3-dev libnl-route-3-dev libcap2-bin}.each do |pkg|
  package pkg do
    action :install
  end
end

# Clone project sources
git "dabba" do
  repository "git://github.com/eroullit/dabba.git"
  revision "rpc"
  destination "/home/vagrant/dabba"
  action :checkout
  action :sync
end

# Create directory to enable out-of-source build
directory "/home/vagrant/dabba/build" do
  action :create
end

bash "compile" do
  cwd "/home/vagrant/dabba/build"
  code <<-EOH
  cmake ..
  make
  EOH
end
