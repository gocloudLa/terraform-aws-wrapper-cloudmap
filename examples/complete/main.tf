module "wrapper_cloudmap" {
  source = "../../"

  metadata = local.metadata

  cloudmap_parameters = {
    "project1.${local.zone_internal}" = {}
    "project2.${local.zone_internal}" = {}
  }

  # Deberia venir como output del modulo de wrapper_vpc.
  # vpc_id = module.wrapper_vpc.vpc.vpc_id
  # vpc_id = "vpc-xxxxxxxxxxxxxx"
  vpc_id = "vpc-0089bac63387b453c"

}
