package :imagemagick do
  apt %w(imagemagick libmagick9-dev)

  verify { has_executable "convert" }
end

package :rmagick do
  gem "rmagick"

  requires :imagemagick, :ruby  
  verify { ruby_can_load "RMagick" }
end
