# Install dabba dependencies
dabba_deps = %w{libprotobuf-c0-dev protobuf-c-compiler libnl-3-dev libnl-genl-3-dev libnl-route-3-dev libcap2-bin}

# Install dabba optional packages
dabba_opt_deps = %w{python-yaml}

# Install build packages
build_deps = %w{build-essential git cmake}

[dabba_deps, dabba_opt_deps, build_deps].each do |pkg_list|
  pkg_list.each do |pkg|
    package pkg do
      action :install
    end
  end
end

# Clone project sources
git "dabba" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/eroullit/dabba.git"
  revision "master"
  destination "/home/vagrant/dabba"
  action :checkout
  action :sync
end

# Create directory to enable out-of-source build
directory "/home/vagrant/dabba/build" do
  action :create
  user "vagrant"
  group "vagrant"
end

bash "compile" do
  user "vagrant"
  group "vagrant"
  cwd "/home/vagrant/dabba/build"
  code <<-EOH
  cmake ..
  make
  EOH
end
