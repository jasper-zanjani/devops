# Use environment variables or a credentials file to store credentials

variable "secret_key" { }

provider "aws" {
    access_key = "AKIAZ2G54UZXCEIHB3Y4"
    secret_key = var.secret_key
    region = "us-east-1"
}

data "aws_ssm_parameter" "amzn2_linux" {
    name= "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_vpc" "app" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
}

resource "aws_internet_gateway" "app" {
    vpc_id = aws_vpc.app.id
}

resource "aws_subnet" "public_subnet1" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.app.id
    map_public_ip_on_launch = true
}

resource "aws_route_table" "app" {
    vpc_id = aws_vpc.app.id

    route {
        cidr_block = "0.0.0.0/10"
        gateway_id = aws_internet_gateway.app.id
    }
}

resource "aws_route_table_association" "app_subnet1" {
    subnet_id = aws_subnet.public_subnet1.id
    route_table_id = aws_route_table.app.id
}

resource "aws_security_group" "nginx_sg" {
    name = "nginx_sg"
    vpc_id = aws_vpc.app.id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "nginx1" {
    ami = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet1.id
    vpc_security_group_ids = [aws_security_group.nginx_sg.id]

    user_data = <<EOF
#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service nginx start
sudo rm /usr/share/nginx/html/index.html
echo '<html><body><h1>Taco Team Server</h1></body></html>"
EOF

}
