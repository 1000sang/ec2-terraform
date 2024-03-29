locals {
  context = yamldecode(file(var.config_file)).context
  config  = yamldecode(templatefile(var.config_file, local.context))
}

locals {
  remote_states = {
    "network" = data.tfe_outputs.this["network"].values
    "lb" = data.tfe_outputs.this["lb"].values
    "bastion" = data.tfe_outputs.this["bastion"].values
  }

  vpc_id = local.remote_states["network"].vpc_id
  public_subnet_ids = local.remote_states["network"].public_subnet_ids
  private_subnet_ids = local.remote_states["network"].private_subnet_ids
  private_subnet_azs = local.remote_states["network"].private_subnet_azs
  load_balancer_arn = local.remote_states["lb"].load_balancer_arn
  lb_sg_id = local.remote_states["lb"].sg_id
  bastion_sg_id = local.remote_states["bastion"].bastion_sg_id
  
}


