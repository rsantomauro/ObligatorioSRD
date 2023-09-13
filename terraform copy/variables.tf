# Se define el perfil de AWS Cli
variable "perfil" {
    default = "obligatorio"
}

# Se define la region de AWS Cli
variable "region" {
  default = "us-east-1"
}

# Se define la porcion de red
variable "cidr_block" {
    default = "172.16."
}

variable "arn_id" {
  description = "ARN ID"
  default = "136612455001"
}

variable "ami" {
  description = "ami"
  default = "ami-053b0d53c279acc90"
}
