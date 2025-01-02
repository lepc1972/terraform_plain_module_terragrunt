output "vpc_id" {
value = aws_vpc.main.id

}
output "vpc_cidr_block" {
value = aws_vpc.main.cidr_block

}
output "public_subnet_ids" {
value = [
    aws_subnet.public_us_east_2a.id,
    aws_subnet.public_us_east_2b.id
]

}
output "private_subnet_ids" {
value = [
    aws_subnet.private_us_east_2a.id,
    aws_subnet.private_us_east_2b.id
]

}
