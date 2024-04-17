
module "jenkins_sg" {
  source = "./modules/security_group"
}

module "jenkins_instance" {
  source = "./modules/ec2_instance_jenkins"
}

module "sonar_instance" {
  source = "./modules/ec2_instance_sonarqube"
}
