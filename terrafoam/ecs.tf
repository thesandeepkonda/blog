resource "aws_ecs_cluster" "blog_cluster" {
  name = "blog-cluster"
}
resource "aws_ecs_task_definition" "blog_task" {
  family                   = "personalblog"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name  = "personalblog"
      image = "<ECR_IMAGE_URL>"
      portMappings = [
        {
          containerPort = 80
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "blog_service" {
  name            = "personalblog-service"
  cluster         = aws_ecs_cluster.blog_cluster.id
  task_definition = aws_ecs_task_definition.blog_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = ["your-subnet"]
    security_groups = ["your-sg"]
    assign_public_ip = true
  }
}

