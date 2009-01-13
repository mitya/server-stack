package :build_essential do
  description 'Build tools'
  apt 'build-essential' do
    pre :install, ['aptitude update', 'aptitude safe-upgrade -y']
  end
end
