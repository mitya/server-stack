#!/usr/bin/env sprinkle -s

require 'packages/essential'
require 'packages/apache'
require 'packages/git_pkg'
require 'packages/ree_pkg'
require 'packages/memcached'
require 'packages/postgresql'
require 'packages/mysql'
require 'packages/rmagick'
require 'packages/sphinx'

policy :universal_server, :roles => :app do
  requires :apache
  requires :apache_etag_support
  requires :apache_deflate_support
  requires :apache_expires_support
  requires :ruby_enterprise_pkg
  requires :passenger
  requires :mysql
  requires :mysql_ruby_driver
  requires :git_pkg
  requires :memcached
  requires :rmagick
  requires :thinking_sphinx
end

deployment do
  delivery :capistrano do
    recipes 'deploy'
  end
 
  source do
    prefix   '/usr/local'
    archives '/usr/local/sources'
    builds   '/usr/local/build'
  end
end

class Sprinkle::Installers::Deb
  def install_commands #:nodoc:
    ["wget -cq --directory-prefix=/tmp #{@packages.join(' ')}",
    "dpkg -i #{@packages.collect{|p| "/tmp/#{package_name(p)}"}.join(" ")}"]
  end
end
