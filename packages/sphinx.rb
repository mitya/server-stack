package :sphinx do
  description 'SQL full-text search engine'
  version '0.9.8.1'

  source "http://www.sphinxsearch.com/downloads/sphinx-#{version}.tar.gz" do
    enable %w(id64)
  end

  requires :mysql
  verify { has_executable 'indexer' }
end

package :thinking_sphinx do
  gem  "freelancing-god-thinking-sphinx"
  
  requires :sphinx, :ruby
  verify { ruby_can_load "thinking_sphinx" }
end