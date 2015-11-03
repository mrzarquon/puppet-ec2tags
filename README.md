ec2tags facter module

This is a simple module that creates an ec2tags structured fact that you can reference in manifests.

The usual deployment process would be to include this along with ensuring the aws-sdk-core gem is installed in your environment (if you are using the puppetlabs-aws module you may have it already), and the nodes have permissions to read tags. The files directory contains an IAM policy that should provide the minimum information - you may want to make a more secure version for your environment.

Thanks to Adrien Thebo and the mutators behind this gist that this was derived from: https://gist.github.com/adrienthebo/75f6180ad508b92de172

Special Note for Windows:

If you would like to use this module on a Windows based machine, please note that the ruby AWS-SDK may run into problems as described in the AWS-SDK issue page found here: https://github.com/aws/aws-sdk-core-ruby/issues/93

To work around this you have two options:

1. Disable peer certificate verification.
2. Configure a valid CA bundle
Disabling the peer verification will work, but I strongly recommend against this for security reasons. The SDK feature for disabling this check is primarily for internal testing.

# I strongly recommend never doing this
Aws.config[:ssl_verify_peer] = false

Or alternatively specify a particular cert bundle. The issue page recommends the bundle from here:  https://raw.githubusercontent.com/bagder/ca-bundle/master/ca-bundle.crt

Aws.config[:ssl_ca_bundle] = '/path/to/ca-bundle.crt'

This line should be placed directly above the line 'ec2 = Aws::EC2::Client.new(region: region)' in ec2tags.rb for proper function.

