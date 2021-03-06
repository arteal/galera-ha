default:
	/usr/sbin/useradd -m --system -s /bin/bash galeraha

install:
	/usr/bin/install -o root -g root -m 755 etc/galera-ha.init /etc/init.d/galera-ha
	/usr/bin/install -o root -g root -m 644 etc/logrotate.d/galera-ha.logrotate /etc/logrotate.d/galera-ha
	/usr/bin/install -o root -g root -m 755 bin/galera-ha /usr/local/bin
	/usr/bin/install -o galeraha -g root -m 644 etc/galera-ha.yaml /etc/
	/usr/bin/gem install --no-ri --no-rdoc bundler
	/usr/local/bin/bundle install
	/usr/sbin/update-rc.d galera-ha defaults

start:
	/etc/init.d/galera-ha
