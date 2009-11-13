package :git_pkg, :provides => :scm do
  description 'Git Distributed Version Control'

  apt "git-core"
  
  verify do
    has_executable 'git'
  end
end
