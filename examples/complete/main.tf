module "wrapper_cloudmap" {
  source = "../../"

  metadata = local.metadata

  cloudmap_parameters = {
    "project1.${local.zone_internal}" = {
      vpc = "networking"
      # Or: vpc_id = "vpc-xxxxxxxxxxxxxx"
    }
    "project2.${local.zone_internal}" = {
      vpc = "networking"
    }
  }

  # Should come from wrapper_vpc (e.g. `vpc_parameter = { vpcs = module.wrapper_vpc.vpcs }`). Hardcoded here only so this example is self-contained.
  vpc_parameter = {
    vpcs = {
      networking = { vpc_id = "vpc-xxxxxxxxxxxxxx" }
    }
  }
}
