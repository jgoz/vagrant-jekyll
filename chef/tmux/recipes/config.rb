remote_file "/home/vagrant/.tmux.conf" do
  source "https://github.com/jgoz/dotfiles/raw/master/.tmux.conf"
  owner "vagrant"
  group "vagrant"
  action :create
end
