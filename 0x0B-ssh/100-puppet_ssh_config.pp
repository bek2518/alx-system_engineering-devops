# Make change to configuration file using puppet

file { '/etc/ssh/ssh_config':
  ensure => present
}
file_line { 'Append a line to /etc/ssh/ssh_config':
  path => '/etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/school\nPAsswordAuthentication no'
}
