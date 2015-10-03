class { 'nodejs':
  version => 'stable',
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
