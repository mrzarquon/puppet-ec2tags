# class to install the aws-sdk-core gem
# this does mean there needs to be two puppet runs
# or you can put `gem install aws-sdk-core` or
# /opt/puppetlabs/bin/gem install aws-sdk-core in your
# userdata script
class ec2tags {
  package { 'aws-sdk':
    ensure   => present,
    provider => puppet_gem,
  }
}
