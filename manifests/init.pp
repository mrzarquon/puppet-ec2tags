# class to install the aws-sdk-core gem
# this does mean there needs to be two puppet runs
# or you can put `gem install aws-sdk-core` or
# /opt/puppet/bin/gem install aws-sdk-core in your
# userdata script
class ec2tags {
  $gem_provider = $is_pe ? {
    'True'  => 'pe_gem',
    default => 'gem',
  }

  package { 'aws-sdk-core':
    ensure   => present,
    provider => $gem_provider,
  }
}
