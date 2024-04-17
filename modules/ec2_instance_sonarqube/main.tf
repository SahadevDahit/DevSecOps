resource "aws_instance" "sonarQube_instance" {
  ami             = "ami-007020fd9c84e18c7"
  instance_type   = "t2.medium"
  key_name        = var.key_name
  security_groups = [var.security_group_name]
  user_data       = templatefile("/modules/ec2_instance_sonarqube/install_sonarqube.sh", {})
  root_block_device {
    volume_size = var.storage_size_gb
  }

  tags = {
    Name = "sonarQube"
  }
}
