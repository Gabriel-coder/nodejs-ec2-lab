variable "vpc_id" {}
variable "allowed_ports" {
  type = list(number)
  default = [22, 3000]
}
