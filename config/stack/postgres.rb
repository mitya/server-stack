package :postgres, :provides => :database do  
  description 'PostgreSQL Database'
  rails_db_user 'testuser'
  rails_db_pwd 'secret'
  apt %w( postgresql postgresql-client postgresql-contrib libpq-dev ) do
    script = <<-SHELL
      VOLUME=\\`file -s /dev/sdh\\`
      if [[ "\\$VOLUME" =~ 'ext3' ]];
      then
        echo "/dev/sdh /mnt/pgsql ext3 noatime 0 0" >> /etc/fstab
        mkdir /mnt/pgsql
        mount /mnt/pgsql
        /etc/init.d/postgresql-8.3 stop
        rm -rf /var/lib/postgresql/8.3/main
        ln -s /mnt/pgsql/main /var/lib/postgresql/8.3/main
        /etc/init.d/postgresql-8.3 start
      else
        yes | mkfs.ext3 /dev/sdh
        echo "/dev/sdh /mnt/pgsql ext3 noatime 0 0" >> /etc/fstab 
        mkdir -p /mnt/pgsql
        mount /mnt/pgsql
        /etc/init.d/postgresql-8.3 stop
        mv /var/lib/postgresql/8.3/main /mnt/pgsql
        ln -s /mnt/pgsql/main /var/lib/postgresql/8.3/main
        chown postgres:postgres /var/lib/postgresql/8.3/main
        /etc/init.d/postgresql-8.3 start
        sudo -u postgres createuser --superuser $USER;
        createdb $USER;
        psql -c \\"CREATE ROLE #{rails_db_user} PASSWORD '#{rails_db_pwd}' SUPERUSER CREATEDB LOGIN\\";
      fi
    SHELL

    post :install, "sudo rm -f /tmp/setup-postgres"
    script.each_line do |line|
      post :install, %{echo "#{line}" >> /tmp/setup-postgres }
    end
    
    post :install, "bash /tmp/setup-postgres"
  end
  
  verify do
    has_executable '/usr/lib/postgresql/8.3/bin/postgres'
  end
end
 
package :postgres_driver do
  description 'Ruby PostgresSQL database driver (native version)'
  gem 'postgres'
  
  requires :ruby
end
