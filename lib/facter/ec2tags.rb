require 'facter'
require 'aws-sdk'
 
if Facter.value("ec2_instance_id") != nil
   instance_id = Facter.value("ec2_instance_id")
   region = Facter.value("ec2_placement_availability_zone")[0..-2]
   ec2 = Aws::EC2::Client.new(region:region)
   instance = ec2.describe_instances(instance_ids:[instance_id])
   tags = instance.reservations[0].instances[0].tags
   tags.each do |tag|
      fact = "ec2_tag_#{tag["key"]}"
      Facter.add(fact) { setcode { tag["value"] } }
   end
  Facter.add("ec2_region") { setcode { region } }
end
