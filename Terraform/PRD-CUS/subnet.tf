resource "aws_subnet" "PRD-CUS-VPC-BASTION-PUB-2A" {
  vpc_id                  = aws_vpc.PRD-CUS-VPC.id
  cidr_block              = "10.250.1.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true # public IP 자동 할당

  tags = {
    Name = "PRD-CUS-VPC-BASTION-PUB-2A"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/k8s-cluster" = "shared"

  }
}

resource "aws_subnet" "PRD-CUS-VPC-BASTION-PUB-2C" {
  vpc_id                  = aws_vpc.PRD-CUS-VPC.id
  cidr_block              = "10.250.11.0/24"
  availability_zone       = "ap-northeast-2c"
  map_public_ip_on_launch = true # Public IP 자동 할당

  tags = {
    Name = "PRD-CUS-VPC-BASTION-PUB-2C"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/k8s-cluster" = "shared"
  }
}

resource "aws_subnet" "PRD-CUS-VPC-PRI-2A" {
  vpc_id            = aws_vpc.PRD-CUS-VPC.id
  cidr_block        = "10.250.2.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "PRD-CUS-VPC-PRI-2A"
    "kubernetes.io/role/internal-elb" = "1" 
    "kubernetes.io/cluster/k8s-cluster" = "shared" 
  }
}

resource "aws_subnet" "PRD-CUS-VPC-PRI-2C" {
  vpc_id            = aws_vpc.PRD-CUS-VPC.id
  cidr_block        = "10.250.12.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "PRD-CUS-VPC-PRI-2C"
    "kubernetes.io/role/internal-elb" = "1" 
    "kubernetes.io/cluster/k8s-cluster" = "shared"
  }
}