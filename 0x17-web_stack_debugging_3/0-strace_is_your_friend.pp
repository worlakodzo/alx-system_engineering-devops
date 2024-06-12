# find the file that class-wp-locale.phpp and replace it to class-wp-locale.php

# Ensure the /var/www/html directory exists
file { '/var/www/html':
  ensure => directory,
}

exec { '0-strace_is_your_friend':
  command => 'grep -rl "class-wp-locale.phpp" /var/www/html/ | xargs sed -i \'s/class-wp-locale.phpp/class-wp-locale.php/g\'',
  path    => '/bin:/usr/bin:/usr/local/bin',
  onlyif  => 'grep -rl "class-wp-locale.phpp" /var/www/html/',
  require => File['/var/www/html'],
}

# Restart the WordPress service
service { 'wordpress':
  ensure    => 'running',
  enable    => true,
  subscribe => Exec['0-strace_is_your_friend'],
}
