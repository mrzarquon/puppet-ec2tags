Facter.add(:ec2_region) do
  confine do
    Facter.value(:ec2_instance_id)
  end
  setcode do
    region = Facter.value("ec2_placement_availability_zone")[0..-2]
    region
  end
end

Facter.add(:ec2_tags) do
  confine do
    begin
      require 'aws-sdk-core'
      true
    rescue LoadError
      false
    end
  end

  confine do
    Facter.value(:ec2_iam_info_0)
  end

  setcode do
    instance_id = Facter.value("ec2_instance_id")
    region = Facter.value("ec2_region")
    ec2 = Aws::EC2::Client.new(region: region)
    instance = ec2.describe_instances(instance_ids: [instance_id])
    tags = instance.reservations[0].instances[0].tags
    taghash = { }
    tags.each do |tag|
      taghash[tag['key']] = tag['value']
    end
    taghash
  end
end
