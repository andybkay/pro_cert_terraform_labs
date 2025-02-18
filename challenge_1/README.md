# Starting off gentle to get things going, here's challenge #1

## Info
There's a file in this folder called main.tf, and it builds some resources in AWS. The file was created by an engineer as they were starting their journey in Terraform, and the time has come to refactor this into something that is more in line with best practices.

## What needs to be changed
* Break the file up into something that's a little more readable and better organised, e.g. vpc.tf, locals.tf etc
* Expand the subnets from 1 to as many as possible in the region, ensuring there are at least 4200 ip addresses per subnet
* Ensure there is version control on the provider to 5.87.0
* Move hardcoded elements into variables for repeatability
* Introduce a tfvars file to simplify deployment to multiple environments (dev and prod will suffice)

## Next steps
* Turn this into a module that can be reused. Follow best practices around providers and variables
