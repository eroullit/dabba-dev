# Install dependencies
%w{build-essential git cmake python-yaml libprotobuf-c0-dev protobuf-c-compiler libnl-3-dev libnl-genl-3-dev libnl-route-3-dev libcap2-bin}.each do |pkg|
  package pkg do
    action :install
  end
end

# Clone project sources
git "dabba" do
  repository "git://github.com/eroullit/dabba.git"
  revision "rpc"
  destination "/home/vagrant/vcs/git/dabba"
  action :checkout
end

bash "compile" do
  user "vagrant"
  cwd "/home/vagrant/vcs/git/dabba"
  code <<-EOH
  cmake
  make
  EOH
end
