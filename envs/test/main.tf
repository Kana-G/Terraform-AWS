module "aws" {
    source = "../../module"

    cluster-name                = var.luster-name
    region                      = var.region
    vpc_cidr                    = var.vpc_cidr
    subnets                 	= var.subnets
    scaling.                    = var.scaling
    tags                        = var.tags
}