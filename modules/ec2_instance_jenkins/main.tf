resource "aws_instance" "jenkins_instance" {
  ami             = "ami-007020fd9c84e18c7"
  instance_type   = "t2.medium"
  key_name        = var.key_name
  security_groups = [var.security_group_name]
  user_data       = templatefile("/modules/ec2_instance_jenkins/install_jenkins.sh", {})
  root_block_device {
    volume_size = var.storage_size_gb
  }

  tags = {
    Name = "JenkinsInstance"
  }
}
