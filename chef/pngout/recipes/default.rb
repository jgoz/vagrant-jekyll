include_recipe "apt"

packages = value_for_platform(
    "default" => ['libc-bin']
  )

packages.each do |devpkg|
  package devpkg
end

pngout_version = node[:pngout][:version]

node.set[:pngout][:install_path] = "/usr/local/bin"
node.set[:pngout][:binary] = "#{node[:pngout][:install_path]}/pngout"

remote_file "#{Chef::Config[:file_cache_path]}/pngout-#{pngout_version}.tar.gz" do
  source "http://static.jonof.id.au/dl/kenutils/pngout-#{pngout_version}-linux.tar.gz"
  action :create_if_missing
end

bash "extract_pngout_files" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar zxf pngout-#{pngout_version}.tar.gz
    cd pngout-#{pngout_version}-linux
    cp `uname -m`/pngout #{node[:pngout][:install_path]}
  EOH
  creates node[:pngout][:binary]
end

