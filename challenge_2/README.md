# User Management Challenge

## Overview
In this challenge, you will work with JSON data containing user information. You'll need to parse this data and create various lists and counts using Terraform locals. As a hint, this solution is primarily based around the generation of lists.

## Challenge Requirements

### Task 1: Load JSON Data
- Create a local variable to load and parse the provided JSON data file
- The JSON file contains user records with roles and permissions

### Task 2: Create User Lists
- Create a local variable that extracts all usernames into a list
- Create two separate lists:
  - One containing only admin users
  - One containing only support users

### Task 3: Admin Statistics
- Create a local variable that counts the total number of admin users
- Create a local variable that contains a list of admin usernames

## Expected Outputs
Your solution should demonstrate:
- Proper JSON parsing
- List manipulation in Terraform
- Filtering of users based on roles
- Count calculations

## Sample JSON Structure
```json
{
"users": [
        {
            "username": "john_doe",
            "role": "admin"
        },
        {
            "username": "jane_smith",
            "role": "support"
        }
    ]
}
```

## Success Criteria
- All locals are properly defined
- Admin and support user lists are correctly filtered
- Admin count is accurate
- All usernames are properly extracted
- Outputs are created to show that the information has been parsed correctly and could be used elsewhere

## Tips
- Use `jsondecode()` function to parse JSON data
- Utilize `local.users` to access the parsed JSON data
- Consider using `for` expressions for list filtering
- Remember to use consistent naming conventions for locals

## Validation
Test your solution by running:
```bash
terraform plan
```
This will display:
- The total user count
- The admin user list
- The support user list
- The admin count