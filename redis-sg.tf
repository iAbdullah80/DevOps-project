resource "alicloud_security_group" "redis-security-group" {
  name        = "redis-security-group"
  vpc_id = alicloud_vpc.capstone_vpc.id
}

resource "alicloud_security_group_rule" "redis-alow_bastion_ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.redis-security-group.id
  source_security_group_id = alicloud_security_group.bastion.id
}

resource "alicloud_security_group_rule" "redis-alow_htto_redis" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "6379/6379"
  priority          = 1
  security_group_id = alicloud_security_group.redis-security-group.id
  source_security_group_id = alicloud_security_group.http.id
}
