gem_packages = ['jekyll', 'haml', 'compass', 'rake']

gem_packages.each do |pkg|
  gem_package pkg do
    action :install
  end
end

apt_packages = ['pngnq', 'curl']

apt_packages.each do |pkg|
  package pkg do
    action :install
  end
end
