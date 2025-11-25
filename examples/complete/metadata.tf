locals {

  metadata = {
    aws_region     = "us-east-2"
    environment    = "Laboratory"
    public_domain  = "democorp.cloud"
    private_domain = "democorp"

    internal_domain = "democorp.internal"

    key = {
      company = "dmc"
      region  = "use2"
      env     = "lab"
      layer   = "base"
    }
  }

  common_name = join("-", [
    local.metadata.key.company,
    local.metadata.key.env
  ])

}
