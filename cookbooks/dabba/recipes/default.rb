# Create needed directories
directory "/vcs/git/dabba" do
  action :create
  recursive true
end

# Clone project sources
git "dabba" do
  repository "git://github.com/eroullit/dabba.git"
  revision "rpc"
  destination "/vcs/git/dabba"
  action :checkout
end
