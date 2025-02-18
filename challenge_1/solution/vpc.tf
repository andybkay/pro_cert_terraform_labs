data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  # Calculate the number of /19 subnets possible in the VPC CIDR
  # A /19 subnet provides 8192 IP addresses, which exceeds the 4200 requirement
  subnet_newbits = 19 - split("/", var.vpc_cidr)[1]
  az_names       = data.aws_availability_zones.available.names
  # Use the minimum between available AZs and possible subnets to avoid CIDR overflow
  subnet_count = min(length(local.az_names), pow(2, local.subnet_newbits))
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "${var.environment}-vpc"
    Environment = var.environment
  }
}

resource "aws_subnet" "public" {
  count  = local.subnet_count
  vpc_id = aws_vpc.main.id
  # Create /19 subnets (8192 IPs each) within the VPC CIDR
  cidr_block        = cidrsubnet(var.vpc_cidr, local.subnet_newbits, count.index)
  availability_zone = local.az_names[count.index]

  tags = {
    Name        = "${var.environment}-public-subnet-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.environment}-igw"
    Environment = var.environment
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name        = "${var.environment}-public-rt"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
} 