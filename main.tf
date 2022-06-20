# COCUS - DEVOPS CHALLENGE
# by Gutemberg Medeiros (gmedeiros@gmail.com)

resource "aws_kms_key" "kms_key_15" {
  provider = aws.eu-central-1


  tags = {
    env      = "Development"
    archUUID = "7956c7fd-4427-41ec-b46d-669cd7627975"
  }
}

resource "aws_instance" "web-1" {
  provider = aws.eu-central-1

  subnet_id         = aws_subnet.default.id
  instance_type     = "t3a.medium"
  availability_zone = "eu-central-1a"
  ami               = "ami-0c2a979b1dbc84003"

  security_groups = [
    aws_security_group.sg.id,
    aws_security_group.sg.id,
    aws_security_group.sg.id,
    [
      aws_security_group.sg.id,
    ],
    [
      aws_security_group.sg.id,
    ],
    [
      aws_security_group.sg.id,
    ],
    [
      aws_security_group.sg.id,
    ],
  ]
}

resource "aws_lb_listener" "aws_lb_listener-1332d97b" {
  provider = aws.eu-central-1

  port              = 80
  load_balancer_arn = aws_lb.alb.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.aws_lb_target_group_8.arn
  }
}

resource "aws_iam_group" "iam_group_19" {
  provider = aws.eu-central-1

  name = "Developers"
}

resource "aws_lb_target_group" "aws_lb_target_group-3743fd9b" {
  provider = aws.eu-central-1

  vpc_id   = aws_vpc.default.id
  protocol = "HTTP"
  port     = 80
  name     = "target-group"
}

resource "aws_subnet" "aws_subnet-450bc3e9" {
  provider = aws.eu-central-1

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.subnet_cidr
  availability_zone = "us-east-2a"
}

resource "aws_ec2_client_vpn_endpoint" "ec2_client_vpn_endpoint_26" {
  provider = aws.eu-central-1

  server_certificate_arn = aws_kms_key.kms_key_15.key_id
  client_cidr_block      = aws_vpc.default.default_route_table_id

  tags = {
    env      = "Development"
    archUUID = "7956c7fd-4427-41ec-b46d-669cd7627975"
  }
}

resource "aws_cloudwatch_dashboard" "cloudwatch_dashboard_17" {
  provider = aws.eu-central-1

  dashboard_name = "Metrics"
  dashboard_body = "COCUS-DEV-Dashboad"
}

resource "aws_security_group" "sg" {
  provider = aws.eu-central-1

  vpc_id = aws_vpc.default.id
}

resource "aws_internet_gateway" "aws_internet_gateway_12" {
  provider = aws.eu-central-1

  vpc_id = aws_vpc.default.id
}

resource "aws_route53_zone" "route53_zone_24" {
  provider = aws.eu-central-1

  name = "cocus.dev.zone"

  tags = {
    env      = "Development"
    archUUID = "7956c7fd-4427-41ec-b46d-669cd7627975"
  }
}

resource "aws_lb_listener" "lb_listner" {
  provider = aws.eu-central-1

  port              = 8080
  load_balancer_arn = aws_lb.alb.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.aws_lb_target_group_8.arn
  }
}

resource "aws_iam_role" "iam_role_20" {
  provider = aws.eu-central-1

  assume_role_policy = "Dev-role-policy"

  tags = {
    env      = "Development"
    archUUID = "7956c7fd-4427-41ec-b46d-669cd7627975"
  }
}

resource "aws_db_instance" "mysql-856dc7cc" {
  provider = aws.eu-central-1

  instance_class    = aws_instance.t2.medium
  availability_zone = "eu-central-1c"

  tags = {
    env      = "Development"
    archUUID = "7956c7fd-4427-41ec-b46d-669cd7627975"
  }
}

resource "aws_lb_target_group_attachment" "aws_lb_target_group_attachment_10" {
  provider = aws.eu-central-1

  target_id        = aws_instance.web-1.id
  target_group_arn = aws_lb_target_group.aws_lb_target_group_8.arn
}

resource "aws_lb" "alb" {
  provider = aws.eu-central-1


  access_logs {
    enabled = true
    bucket  = "cocus-challenger-dev-logs"
  }

  security_groups = [
    aws_security_group.sg.id,
  ]

  subnets = [
    aws_subnet.default.id,
    aws_subnet.subnet2.id,
  ]
}

resource "aws_vpn_gateway" "vpn_gateway_27" {
  provider = aws.eu-central-1

  vpc_id = aws_vpc.default.id

  tags = {
    env      = "Development"
    archUUID = "7956c7fd-4427-41ec-b46d-669cd7627975"
  }
}

resource "aws_cloudwatch_log_metric_filter" "cloudwatch_log_metric_filter-b7343633" {
  provider = aws.eu-central-1

  pattern        = "yaml"
  name           = "apache2"
  log_group_name = "apache2-logs"
}

resource "aws_lb_target_group_attachment" "aws_lb_target_group_attachment-ba0c8b29" {
  provider = aws.eu-central-1

  target_id        = aws_instance.web-1.id
  target_group_arn = aws_lb_target_group.aws_lb_target_group_8.arn
}

resource "aws_subnet" "default" {
  provider = aws.eu-central-1

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.subnet_cidr
  availability_zone = "us-east-2a"
}

resource "aws_db_instance" "mysql_14" {
  provider = aws.eu-central-1

  instance_class          = aws_instance.t2.medium
  db_name                 = "cocus-db"
  backup_window           = "12"
  backup_retention_period = 210
  availability_zone       = "eu-central-1b"

  tags = {
    env      = "Development"
    archUUID = "7956c7fd-4427-41ec-b46d-669cd7627975"
  }
}

resource "aws_lambda_function" "lambda_app" {
  provider = aws.eu-central-1

  role          = aws_ima_id
  publish       = true
  function_name = aws_lambda_function.lambda_app

  tags = {
    env      = "Development"
    archUUID = "7956c7fd-4427-41ec-b46d-669cd7627975"
  }
}

resource "aws_lb_target_group" "aws_lb_target_group_8" {
  provider = aws.eu-central-1

  vpc_id   = aws_vpc.default.id
  protocol = "HTTP"
  port     = 80
  name     = "target-group"
}

resource "aws_db_instance" "mysql_16" {
  provider = aws.eu-central-1

  instance_class    = aws_instance.t2.medium
  availability_zone = "eu-central-1c"

  tags = {
    env      = "Development"
    archUUID = "7956c7fd-4427-41ec-b46d-669cd7627975"
  }
}

resource "aws_instance" "t3a-e38bb1e9" {
  provider = aws.eu-central-1

  subnet_id         = aws_subnet.default.id
  instance_type     = "t3a.medium"
  availability_zone = "eu-central-1a"
  ami               = "ami-0c2a979b1dbc84003"

  security_groups = [
    aws_security_group.sg.id,
    aws_security_group.sg.id,
    aws_security_group.sg.id,
    [
      aws_security_group.sg.id,
    ],
    [
      aws_security_group.sg.id,
    ],
    [
      aws_security_group.sg.id,
    ],
    [
      aws_security_group.sg.id,
    ],
  ]
}

resource "aws_subnet" "aws_subnet-e47ca344" {
  provider = aws.eu-central-1

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.subnet_cidr
  availability_zone = "us-east-2a"
}

resource "aws_vpc" "default" {
  provider = aws.eu-central-1

  cidr_block = "10.0.0.0/16"
}

resource "aws_iam_policy" "iam_policy_21" {
  provider = aws.eu-central-1

  policy = "Dev-access"

  tags = {
    env      = "Development"
    archUUID = "7956c7fd-4427-41ec-b46d-669cd7627975"
  }
}

resource "aws_s3_bucket" "s3_bucket_22" {
  provider = aws.eu-central-1


  tags = {
    env      = "Development"
    archUUID = "7956c7fd-4427-41ec-b46d-669cd7627975"
  }
}