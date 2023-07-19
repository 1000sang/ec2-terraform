locals{
    context = yamldecode(file(var.config_file)).context
    config = yamldecode(templatefile(var.config_file, local.context))
}

locals {
    remote_states = {
        "s3" = data.tfe_outputs.this["s3"].values
        "network" = data.tfe_outputs.this["network"].values
    }

    bucket = local.remote_states["s3"].bucket
    vpc_id = local.remote_states["network"].vpc_id
    public_subnet_ids = local.remote_states["network"].public_subnet_ids
}