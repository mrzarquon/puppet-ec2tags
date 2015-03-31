ec2tags facter module

This is a simple module that creates an ec2tags structured fact that you can reference in manifests.

The usual deployment process would be to include this along with ensuring the aws-sdk-core gem is installed in your environment (if you are using the puppetlabs-aws module you may have it already), and the nodes have permissions to read tags. The files directory contains an IAM policy that should provide the minimum information - you may want to make a more secure version for your environment.

Thanks to Adrien Thebo and the mutators behind this gist that this was derived from: https://gist.github.com/adrienthebo/75f6180ad508b92de172
