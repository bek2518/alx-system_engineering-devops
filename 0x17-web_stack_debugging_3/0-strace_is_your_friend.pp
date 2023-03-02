# Fixes Apache 500 error

exec { 'fix':
  provider => 'shell',
  path     => '/usr/local/bin/:/bin/',
  command  => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php'
}
