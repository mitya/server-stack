# Require our stack
%w(essential server scm ruby ruby_enterprise mysql postgres memcached).each do |r|
  require File.join(File.dirname(__FILE__), "stack", r)
end

policy :ffolio, :roles => :app do
  requires :appserver
  requires :build_essential
  requires :postgres
  requires :webserver
  requires :scm 
  requires :memcached
  requires :libmemcached
  requires :ruby_enterprise
end

deployment do
  # mechanism for deployment
  delivery :capistrano do
    begin
      recipes 'Capfile'
    rescue LoadError
      recipes 'deploy'
    end
  end
 
  # source based package installer defaults
  source do
    prefix   '/usr/local'
    archives '/usr/local/sources'
    builds   '/usr/local/build'
  end
end
