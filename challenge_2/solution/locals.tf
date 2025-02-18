locals {
  # Load and parse the JSON data
  raw_data = jsondecode(file("${path.module}/../users.json"))
  users    = local.raw_data.users

  # Create list of all usernames
  all_users = [for user in local.users : user.username]

  # Filter admin users
  admin_users = [
    for user in local.users : user.username
    if user.role == "admin"
  ]

  # Filter support users
  support_users = [
    for user in local.users : user.username
    if user.role == "support"
  ]

  # Calculate admin count
  admin_count = length(local.admin_users)
}
