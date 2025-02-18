output "total_user_count" {
  description = "The total number of users in the system."
  value       = length(local.all_users)
}

output "admin_users" {
  description = "List of all admin users."
  value       = local.admin_users
}

output "support_users" {
  description = "List of all support users."
  value       = local.support_users
}

output "admin_count" {
  description = "Total number of admin users."
  value       = local.admin_count
}