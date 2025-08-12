variable "resource_group_name" {
  description = "aaaaa"
  type        = string
}

variable "location" {
  description = "aaaaa"
  type        = string
}

variable "storage_account_name" {
  description = "aaaaa"
  type        = string
}

variable "storage_account_tier" {
  description = "aaaaa"
  type        = string
}

variable "storage_account_replication_type" {
  description = "aaaaa"
  type        = string
  default     = "LRS"
}

variable "tags" {
  description = ""
  type        = map(string)
}