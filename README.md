## How to get your sprinkle on:

* Get a brand spanking new slice / host (Ubuntu please)
* Create yourself a user, add yourself to the /etc/sudoers file
* Set your slices url / ip address in deploy.rb (config/deploy.rb.example provided)
* Set username in config/deploy.rb if it isn't the same as your local machine (config/deploy.rb.example provided)

From your local system (from the passenger-stack directory), run:

    sprinkle -c -s install.rb

After you've waited for everything to run, you should have a provisioned slice.
Go forth and install your custom configurations, add vhosts and other VPS paraphernalia.

### Contents

* Apache (Apt)
  * Scripts and stylesheets are compressed using mod_deflate
  * ETags are applied to static assets
  * Expires headers are applied to static assets
* Ruby Enterprise (Source or deb package) [includes rubygems]
* Passenger (Rubygem)
* Memcached (Apt)
* Libmemcached (Source)
* MySQL (Apt) or PostgreSQL (Apt)
* MySQL or PostgreSQL ruby database drivers (Rubygem)
* Git (Apt)
* Sphinx with ThinkingSphinx. It is configured to use 64 bit document IDs.
* RMagick with ImageMagick
* Git (using apt or source)

## Requirements
* Ruby
* Capistrano
* Sprinkle (github.com/crafterm/sprinkle)
* An Ubuntu or Debian based VPS
