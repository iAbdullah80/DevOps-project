resource "alicloud_security_group" "mysql-security-group" {
  name        = "mysql-security-group"
  vpc_id = alicloud_vpc.capstone_vpc.id
}

resource "alicloud_security_group_rule" "mysql-alow_bastion_ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.mysql-security-group.id
  source_security_group_id = alicloud_security_group.bastion.id
}

resource "alicloud_security_group_rule" "mysql-alow_http_mysql" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "3306/3306"
  priority          = 1
  security_group_id = alicloud_security_group.mysql-security-group.id
  source_security_group_id = alicloud_security_group.http.id
}
