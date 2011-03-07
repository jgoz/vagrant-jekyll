include_recipe "apt"
include_recipe "build-essential"

packages = value_for_platform(
    "default" => ['libevent-1.4-2', 'libevent-dev', 'libncurses5-dev']
  )

packages.each do |devpkg|
  package devpkg
end

tmux_version = node[:tmux][:version]

node.set[:tmux][:install_path]    = "/usr/local"
node.set[:tmux][:src_binary]    = "#{node[:tmux][:install_path]}/bin/tmux"
node.set[:tmux][:configure_flags] = [
  "--prefix=#{node[:tmux][:install_path]}"
]

configure_flags = node[:tmux][:configure_flags].join(" ")

remote_file "#{Chef::Config[:file_cache_path]}/tmux-#{tmux_version}.tar.gz" do
  source "http://downloads.sourceforge.net/tmux/tmux-#{tmux_version}.tar.gz"
  action :create_if_missing
end

bash "compile_tmux_source" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar zxf tmux-#{tmux_version}.tar.gz
    cd tmux-#{tmux_version} && ./configure #{configure_flags}
    make && make install
  EOH
  creates node[:tmux][:src_binary]
end

