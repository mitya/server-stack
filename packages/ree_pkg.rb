package :ruby_enterprise_pkg, :provides => :ruby do
  description 'Ruby Enterprise Edition'
  install_path = "/usr/local"
  
  deb "http://rubyforge.org/frs/download.php/66164/ruby-enterprise_1.8.7-2009.10_i386.deb"
  post :install, "gem sources -a http://gems.github.com"

  verify { has_executable "ruby" }
end
