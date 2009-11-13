server "ec2-67-202-52-193.compute-1.amazonaws.com", :app
set :user, "ubuntu"
set :ssh_options, {:keys => ["/users/dima/.ssh/id_demo"]}
