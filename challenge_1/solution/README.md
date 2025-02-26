# Terraform Challenge 1: VPC and Subnet Optimization

## Challenge Description

Given a basic Terraform configuration for AWS infrastructure, improve it by implementing best practices and specific requirements.

### Initial State Issues
- All resources were defined in a single `main.tf` file
- Hardcoded values throughout the configuration
- Single subnet configuration
- No provider version constraints
- No environment-specific configurations
- Limited tagging strategy
- No variable definitions

### Requirements
1. **Code Organization**
   - Split resources into logical files
   - Implement proper variable definitions
   - Add provider version constraints

2. **Networking**
   - Create subnets across all available Availability Zones
   - Ensure each subnet has at least 4,200 IP addresses
   - Implement proper CIDR calculations

3. **Environment Support**
   - Add environment-specific configurations
   - Implement consistent resource naming
   - Add environment tagging

## Solution Details

### File Structure
The solution splits the configuration into multiple files:
- `providers.tf`: AWS provider configuration
- `variables.tf`: Variable definitions
- `vpc.tf`: VPC and networking resources
- `security.tf`: Security group definitions
- `ec2.tf`: EC2 instance configuration
- `dev.tfvars` & `prod.tfvars`: Environment-specific values

### Key Improvements

1. **Provider Configuration**
   - Added explicit provider version constraint (5.87.0)
   - Moved provider configuration to dedicated file

2. **Networking Enhancements**
   - Implemented dynamic AZ discovery
   - Configured /19 subnets (8,192 IPs each) exceeding the 4,200 IP requirement
   - Added CIDR calculations for subnet distribution
   - Created subnets across all available AZs

3. **Variable Management**
   - Moved hardcoded values to variables
   - Added environment-specific tfvars files
   - Implemented proper variable typing and descriptions

4. **Resource Naming and Tagging**
   - Added consistent naming convention using environment prefix
   - Implemented standardized tagging strategy
   - Added environment tags to all resources

### Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Plan/Apply for Development:
```bash
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

3. Plan/Apply for Production:
```bash
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars"
```

### Technical Details

#### Subnet Calculations
- Uses /19 subnet mask providing 8,192 IP addresses per subnet
- Dynamically calculates maximum possible subnets within VPC CIDR
- Implements safeguards against CIDR range overflow

#### Resource Organization
- VPC resources grouped in `vpc.tf`
- Security configurations isolated in `security.tf`
- Compute resources in `ec2.tf`
- Clear separation of concerns

#### Variable Structure
- Region configuration
- Environment naming
- CIDR block definitions
- Instance specifications
- AMI selection

## Best Practices Implemented
- DRY (Don't Repeat Yourself) principle
- Infrastructure as Code (IaC) modularity
- Clear resource organization
- Dynamic resource creation
- Environment-based configuration
- Consistent naming conventions
- Proper tagging strategy