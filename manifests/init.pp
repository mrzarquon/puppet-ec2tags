# class to install the aws-sdk-core gem
# this does mean there needs to be two puppet runs
# or you can put `gem install aws-sdk-core` or
# /opt/puppetlabs/bin/gem install aws-sdk-core in your
# userdata script
class ec2tags (
  $confine_to_aws = True,
  ){

  if $confine_to_aws == True {
    if $ec2_metadata != '' {
      $install_aws_sdk = True
    }
    else {
      $install_aws_sdk = False
    }
  }
  else {
    $install_aws_sdk = True
  }





  $gem_provider = $is_pe ? {
    'True'  => 'pe_gem',
    default => 'gem',
  }

  package { 'aws-sdk-core':
    ensure   => present,
    provider => $gem_provider,
  }
}
