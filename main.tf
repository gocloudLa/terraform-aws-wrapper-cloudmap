resource "aws_service_discovery_private_dns_namespace" "private" {
  for_each = var.cloudmap_parameters

  name        = each.key
  vpc         = try(each.value.vpc_id, var.vpc_id)
  description = "Managed by Terraform"

  tags = merge(local.common_tags, try(each.value.tags, var.cloudmap_defaults.tags, null))
}

# resource "aws_service_discovery_public_dns_namespace" "public" {
#   for_each    = local.enable_cloud_map_public
#   name        = each.key
#   description = "Managed by Terraform"
#   tags        = local.common_tags
# }