variable "vpc_id" {
  type        = string
  description = "ID da VPC"
}

variable "region" {
  type        = string
  description = "Região AWS"
}

variable "environment" {
  type        = string
  description = "Ambiente (ex: dev, prod)"
}

variable "private_subnet_1_cidr" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}
