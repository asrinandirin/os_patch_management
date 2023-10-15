variable "patch_deployment_id" {
    type = string
}

variable "instances" {
  type = list(string)
}

variable "instance_prefix" {
  type = list(string)
  default = []
}

// YUM CONFIGS

variable "security" {
  type = bool
}

variable "minimal" {
  type = bool
  default = false
}

variable "excludes" {
  type = list(string)
  default = []
}

variable "exclusive_packages" {
  type = list(string)
  default = []
}

// WINDOWS CONFIGS 

variable "classifications" {
  type = list(string)
  default = []
}

variable "duration" {
  type = string
  default = "5600s"
}

variable "reboot_config" {
  type = string
  default = "NEVER"
}

variable "time_zone" {
  type = string
  default = "Europe/Istanbul"
}

// Time, Default 12.30 AM

variable "time_of_day" {
  type = list(number)
  default = [ 0,30,0,0 ]
}

variable "month_day" {
  type = number
  default = 2
}




