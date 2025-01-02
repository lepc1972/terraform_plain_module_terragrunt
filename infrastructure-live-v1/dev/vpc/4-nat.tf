resource "aws_eip" "nat" {
    vpc = true      # This is required for the EIP to be associated with the NAT Gateway    

    tags = {
        Name = "dev-nat"
    } 
    
  
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat.id
    subnet_id     = aws_subnet.public_us_east_2a.id

    tags = {
        Name = "dev-nat"
    }

    depends_on = [  
        aws_internet_gateway.igw
    ]
  
}