locals {
  context = yamldecode(file(var.config_file)).context
  config  = yamldecode(templatefile(var.config_file, local.context))
}

locals {
  remote_states = {
    "ecr-nest" = data.tfe_outputs.this["ecr-nest"].values
    "lb" = data.tfe_outputs.this["lb"].values
    "network" = data.tfe_outputs.this["network"].values
    "ecs" = data.tfe_outputs.this["ecs"].values
  }

  role_arn = local.remote_states["ecs"].execution_role_arn
  ecs_id = local.remote_states["ecs"].id
  repository_url = local.remote_states["ecr-nest"].repository_url
  load_balancer_arn = local.remote_states["lb"].load_balancer_arn
  public_subnet_ids = local.remote_states["network"].public_subnet_ids
  private_subnet_ids = local.remote_states["network"].private_subnet_ids
  vpc_id = local.remote_states["network"].vpc_id
}
