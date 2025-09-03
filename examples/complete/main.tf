module "wrapper_cloudmap" {
  source = "../../"

  metadata = local.metadata

  cloudmap_parameters = {
    "project1.${local.zone_internal}" = {
      # Optional: Override VPC ID for this specific namespace
      # vpc_id = "vpc-specific-for-project1"
    }
    "project2.${local.zone_internal}" = {
      # Optional: Override VPC ID for this specific namespace
      # vpc_id = "vpc-specific-for-project2"
    }
  }

  # Deberia venir como output del modulo de wrapper_vpc.
  # vpc_id = module.wrapper_vpc.vpc.vpc_id
  
  vpc_id = "vpc-xxxxxxxxxxxxxx"
}
