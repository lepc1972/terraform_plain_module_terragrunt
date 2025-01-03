resource "aws_eip" "this" {
  vpc = true # This is required for the EIP to be associated with the NAT Gateway    

  tags = {
    Name = "$(var.env)-nat"
  }


}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "$(var.env)-nat"
  }

  depends_on = [
    aws_internet_gateway.this
  ]

}