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
