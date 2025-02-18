# Challenge 2 Solution - User Management

## Solution Overview
This solution demonstrates how to work with JSON data in Terraform using locals to parse and manipulate user information.

## Solution Components

### JSON Data Processing
The solution uses two main Terraform functions:
- `file()`: Reads the JSON file content
- `jsondecode()`: Parses the JSON string into a Terraform object
```hcl
locals {
raw_data = jsondecode(file("${path.module}/../users.json"))
users = local.raw_data.users
}
```

### List Creation
The solution creates several lists using Terraform's `for` expressions:

1. **All Users List**
```hcl
all_users = [for user in local.users : user.username]
```
This creates a flat list of all usernames from the JSON data.

2. **Role-Based Lists**
```hcl
admin_users = [
  for user in local.users : user.username
  if user.role == "admin"
]

support_users = [
  for user in local.users : user.username
  if user.role == "support"
]
```
These create filtered lists based on user roles.

### Statistics
The admin count is calculated using the `length()` function:
```hcl
admin_count = length(local.admin_users)
```

## Output Validation
The solution includes outputs to verify the results:
- `total_user_count`: Shows the total number of users
- `admin_users`: Displays the list of admin users
- `support_users`: Displays the list of support users
- `admin_count`: Shows the total count of admin users

## Key Concepts Used
- JSON parsing in Terraform
- List comprehensions with filtering
- Local variable definitions
- Output configurations
- Path references using `path.module`

## Testing the Solution
To test this solution:
1. Ensure your JSON file is in the correct location
2. Run `terraform init`
3. Run `terraform plan` to see the processed data