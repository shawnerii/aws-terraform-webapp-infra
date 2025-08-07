variable "db_password" {
  description = "Password for RDS nodeapp user"
  type        = string
  sensitive   = true
}