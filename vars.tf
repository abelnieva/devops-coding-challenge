variable "projectName" {
  default = "Challenge TrueNorth "
}

variable "sufix_challenge" {
  default = "CHTN"
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "key.pem"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "key.pem.pub"
}

variable "service_max_size" {
  default = 1
}

variable "service_min_size" {
  default = 1
}

variable "AMIS" {
  type = "map"

  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
}

variable "healthcheckpath" {
  default = "version"
}

variable "ELB_port" {
  default = 80
}

variable "ec2_port" {
  default = 80
}
