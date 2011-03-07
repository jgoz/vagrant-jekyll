gem_packages = ['jekyll', 'haml', 'compass', 'rake']

gem_packages.each do |pkg|
  gem_package pkg do
    action :install
  end
end
