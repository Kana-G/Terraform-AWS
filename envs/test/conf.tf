variable "cluster-name" {
  type    = string
  default = "kana-eks-test"
}

variable "region" {
  description = "AWS region to use for environment"
  default     = "us-east-2"
}

variable "scaling" {
  description = "The scaling capacity of the cluster."
  type        = map(any)
  default = {
    desired = 1
    max     = 1
    min     = 1
  }
}

variable "sg_name" {
  description = "Default security group for the cluster."
  type        = string
  default     = "kube_sg"
}

variable "subnets" {
  description = "Subnets where cluster resources are deployed."
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "tags" {
  description = "Default tags to apply to all resources."
  type        = map(any)
  default = {
    provider = "tf"
    env      = "prod-Env"
  }
}

variable "vpc_cidr" {
  description = "CIDR block used by the main VPC."
  type        = string
  default     = "10.0.0.0/20"
}

variable "workstation-external-cidr" {
  type    = string
  default = "0.0.0.0/0"
}

