package :git_src, :provides => :scm do
  description 'Git Distributed Version Control'
  version '1.6.5'

  source "http://kernel.org/pub/software/scm/git/git-#{version}.tar.gz"

  verify { has_executable 'git' }
end

package :git_dependencies do
  description 'Git Build Dependencies'
  apt 'git-core', :dependencies_only => true
end
