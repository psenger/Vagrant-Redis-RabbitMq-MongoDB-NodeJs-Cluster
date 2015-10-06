# crete the group shipit
group { 'shipit':
  ensure => 'present',
  gid    => '1234',
}

# password         => sha1('}4MWt4+uUVL[VT-S5]hhQ[5}<y@k,$2v'),
# password         => '*',
# crete the user shipit
user { 'shipit':
  ensure           => 'present',
  managehome       => true,
  gid              => '1234',
  uid              => '1234',
  home             => '/home/shipit',
  password         => '*',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/sbin/nologin',
  require          => [ Group['shipit'] ],
}

file { '/home/shipit/.ssh' :
    ensure => "directory",
    owner  => "shipit",
    group  => "shipit",
    mode   => 750,
}

#$known_hosts = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDguxroOHupNgqPNNOjBTk3e4iTQl9n4fS/6XUnv5rTjtfj7PYOM0lkp7DmKsL2OODmsU6Gel9k9N3qDO9KSOy1VGzbEVGzBNDA2AUyMUW2PojfGMG7Ujo08I04lpdU5slqi7yKwxdj2HgyLADzZE/FlCfzGjx1kF6URHIej69jCQkD9p7+NJiV08REor1qbOmILqz+uwv+SrRyYHTKUncC01KEEtULBYZXQ89JzINOW6Z4MRbqJSdUt2LH+CPC4OcZaKXW9/RwnzGD1XPpJbxcNg8BPj7Wc9xfa3TywUzsYZeAgJ0rGXOa1mZSjs1IffhjRU5vQdy1Od41jQKAvT3z"
#file { '/home/shipit/.ssh/known_hosts' :
#  ensure  => file,
#  group   => 'shipit',
#  owner   => 'shipit',
#  mode    => 0600,
#  content => inline_template($known_hosts, "\n"),
#  require => [ User['shipit'], File['/home/shipit/.ssh'] ],
#}

ssh_authorized_key { 'philip.a.senger@cngrgroup.com':
  user    => 'shipit',
  type    => 'ssh-rsa',
  key     => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDji22H6siMnmxsvjpbw1lwnjJ9gKL4YAHIxmQA59GZ34BZzdxXDrJLJbnVXjcn1XrWGXmbBj/KJJWSfgBoJ2EOBzBQm9yPVnv7q4ujmpZJwvPH/c6GKS2jz20V5WvTwnByeLEaOLmqpeA/ullrF6ynSisGz+zL1ArjdXAPnqLpQGI9LE+xloXnLhBt4aI9P66f5s57y3a3cUB60XP7vqvYaS0lJHt37CvyppL3fWDUf0WfZt4L1WR1HBgillqXgKc4Cbwy2mOijFrhHeY6hebq1vIFAdLrg1TRTdLgNFHg2kJU1LbfofwgK6nHgmy7WrYsEm7FGXEVLZqlgqGteZowUWDsRWoysEo1tubElK8q7L8ZndImOe8PG+1naWTQ+ehN0+957pvXMqkHC9Y3sczyFkHI2jgc3CNJ8QdKvCrw3GKutNLZKiqDWHxlnIvQ17thHirBjaUvDWY+eFgcvGkHJ6K2BgaRgIo6b8qW6/LJxjevz+R/rnqj3V8JhdtWlBjDSw3vH9+dqIHf7l/0LItN+RGNEvgzNu0nstPlQ+oCi4Behb9LObZN3UU0OlDXHpkakcCNnRqCc19VDb8vddnAaXxUXefP9ACeln4Qrlr8vGKxWw5NRb0QOIthiitZzqcyKzJIui+D52Ug1L2Y5LIDeRPoYVO57DoouhExScb5fQ==',
  require => [ File[ '/home/shipit/.ssh' ] ],
}

class { 'nodejs':
  version => 'stable',
}

package { 'pm2':
  ensure   => 'present',
  provider => 'npm',
  require  => [ Class['nodejs'] ],
}

# class { '::nodejs':
#  manage_package_repo       => false,
#  nodejs_dev_package_ensure => 'present',
#  npm_package_ensure        => 'present',
# }
#
# Install Node.js and npm using the packages from EPEL:
#
# class { '::nodejs':
#  nodejs_dev_package_ensure => 'present',
#  npm_package_ensure        => 'present',
#  repo_class                => '::epel',
# }
