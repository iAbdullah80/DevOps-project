// This is the redis server that will be used to store the data, it is on zone A, 
//and uses secure group called 'private-security-group', and the key pair myKeytest, 
//also its on the private subnet vswitch, internet_max_bandwidth_out is 0 so it will not have a public ip
//also it uses the user data to install redis using the startup.sh script
//THIS SERVER IS ON THE PRIVATE SUBNET AND WILL BE USED TO STORE THE DATA AND ACCESSED BY THE WEB SERVER

resource "alicloud_instance" "redis-server" {
  availability_zone = data.alicloud_zones.default.zones.0.id
  security_groups   = [alicloud_security_group.redis-security-group.id]

  instance_type              = "ecs.g6.large"
  system_disk_category       = "cloud_essd"
  system_disk_size           = 20
  image_id                   = "ubuntu_24_04_x64_20G_alibase_20240812.vhd"
  instance_name              = "redis-server"
  vswitch_id                 = alicloud_vswitch.vswitch_private.id
  internet_max_bandwidth_out = 0
  instance_charge_type       = "PostPaid"
  key_name                   = alicloud_ecs_key_pair.myKey.key_pair_name
  user_data = base64encode(file("redis.sh"))
}
output "redis-ip" {
  value = alicloud_instance.redis-server.private_ip
}
