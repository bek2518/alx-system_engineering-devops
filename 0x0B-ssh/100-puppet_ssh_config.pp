# Make change to configuration file using puppet

exec { 'echo':
  command => 'echo "    IdentityFile ~/.ssh/school\n
  PasswordAuthentication no" >> /etc/ssh/ssh_config',
  path    => '/etc/ssh/ssh_config',
}
