variable "rg" {
  type        = any
  description = "(optional) describe your variable"
}

variable "tags" {
  type        = map(string)
  description = "(optional) tags for the resources"
  default     = {}
}

variable "environment" {
  type        = string
  description = "environment"
  default     = "nonlive"
}

variable "project" {
  type        = string
  description = "(optional) describe your variable"
}

variable "subnet" {
  type        = any
  description = "(optional) describe your variable"
}

variable "create_public_ip" {
  type        = bool
  description = "(optional) describe your variable"
  default     = false
}

variable "cloudinit" {
  type = any
  description = "(optional) describe your variable"
}