variable "region" {
  description = "The AWS region to launch the EC2 instance."
  type        = string
}

variable "ami_map" {
  description = "A map of AMI IDs for different regions."
  type        = map(string)
  default = {
    "us-east-1" = "ami-0fff1b9a61dec8a5f"
    "us-west-1" = "ami-09b2477d43bc5d0ac"
  }
}
variable "instance_type" {
  description = "The type of instance to use."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key pair name to access the EC2 instance."
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the instance."
  type        = list(string)
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in."
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance."
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance."
  type        = bool
  default     = false
}