# Install development packages
dev_deps = %w{build-essential git cmake clang}

# Install packaging packages
pack_deps = %w{rpm dpkg-dev}

# Install extra packages
extra_pkgs = %w{indent devscripts vim tig tmux}

[dev_deps, pack_deps, extra_pkgs].each do |pkg_list|
  pkg_list.each do |pkg|
    package pkg do
      action :install
    end
  end
end

execute "do not check github.com host key strictly" do
  command "echo \"Host github.com\n\tStrictHostKeyChecking no\" >> /home/vagrant/.ssh/config"
end

# Clone dotfiles repository
git "clone dotfiles repository" do
  user "vagrant"
  group "vagrant"
  repository "git@github.com:eroullit/dotfiles.git"
  revision "master"
  destination "/home/vagrant/dotfiles"
  action :checkout
  action :sync
end

execute "install dotfiles" do
  user "vagrant"
  group "vagrant"
  cwd "/home/vagrant/dotfiles"
  command "./install.sh"
  environment 'HOME' => "/home/vagrant"
end
