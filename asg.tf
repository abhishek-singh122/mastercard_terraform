
resource "aws_launch_configuration" "my-launch-config" {
  image_id        = var.webservers_ami
  instance_type   = var.instance_type
  security_groups = ["${aws_security_group.webservers.id}"]

  # user_data = <<-EOF
  #             #!/bin/bash
  #             yum -y install httpd
  #             echo "Hello, from Terraform" > /var/www/html/index.html
  #             service httpd start
  #             chkconfig httpd on
  #             EOF

  user_data = file("install_httpd.sh")

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg_example" {
  launch_configuration = "${aws_launch_configuration.my-launch-config.name}"
  vpc_zone_identifier  = ["${var.public_subnets_cidr}","${var.private_subnets_cidr}"]
  target_group_arns    = ["${var.target_group_arn}"]
  health_check_type    = "ELB"

  min_size = 2
  max_size = 10

  tag {
    key                 = "Name"
    value               = "my-test-asg"
    propagate_at_launch = true
  }
}
