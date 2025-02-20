# Terraform Lab-Style Question: Cross-Referencing Multiple Data Sources
## Scenario:
Your organization maintains infrastructure data in multiple external sources. You need to write a Terraform configuration that cross-references different data sources to dynamically generate locals and outputs.

Data Source 1: AWS S3 bucket contains a JSON file with region-specific environment configurations.
Data Source 2: An AWS Secrets Manager secret that stores database credentials.
Data Source 3: A local CSV file with a mapping of service names to instance types.
Your task is to:

## Retrieve and parse the JSON file from S3.
- Fetch the database credentials from AWS Secrets Manager.
- Read the local CSV file and extract relevant instance types.
- Create a Terraform local that combines all three data sources to generate a structured environment configuration.
- Define an output that displays the final structured configuration.

## Resources & Constraints:
The S3 bucket is named company-configs, and the JSON file env-config.json follows this structure:
```json
{
  "production": {
    "region": "us-east-1",
    "vpc_id": "vpc-abc123"
  },
  "staging": {
    "region": "us-west-2",
    "vpc_id": "vpc-def456"
  }
}
```
The AWS Secrets Manager secret is named db-credentials and stores:
```json
{
  "username": "admin",
  "password": "securepass"
}
```
## The local CSV file service-instances.csv contains:
```pgsql
Copy
Edit
service_name,instance_type
web,t3.medium
database,r5.large
cache,m5.large
```

## Assume the Terraform AWS provider is already configured.

## Expected Outcome:
Your Terraform configuration should:

Create a local variable that maps each environment (production, staging) to its respective VPC ID, database credentials, and recommended instance types for services.
Output a structured JSON with all the relevant configurations.