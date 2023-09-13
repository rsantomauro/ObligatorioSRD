provider "aws" {
  region  = var.region
  profile = var.perfil
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        # RS - No se usa la version 5 porque salio recientemiente y tiene varios cambios.
        version = "4.67.0"
    }
  }
}