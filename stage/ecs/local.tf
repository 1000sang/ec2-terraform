# locals {
#   context = yamldecode(file(var.config_file)).context
#   config  = yamldecode(templatefile(var.config_file, local.context))
# }

# locals {
#   remote_states = {
#     "ecr" = data.tfe_outputs.this["ecr"].values
#     "lb" = data.tfe_outputs.this["lb"].values
#     "network" = data.tfe_outputs.this["network"].values
#   }

#   repository_url = local.remote_states["ecr"].repository_url
#   target_group_arn = local.remote_states["lb"].target_group_arn
#   public_subnet_ids = local.remote_states["network"].public_subnet_ids
#   vpc_id = local.remote_states["network"].vpc_id
# }
