bash "set git configuration" do
  code <<-EOH
    git config --global user.name "jgoz"
    git config --global user.email "johnny@jgoz.net"
  EOH
end
