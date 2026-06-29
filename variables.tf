/*----------------------------------------------------------------------*/
/* Common |                                                             */
/*----------------------------------------------------------------------*/

variable "metadata" {
  type = any
}

/*----------------------------------------------------------------------*/
/* CloudMap | Variable Definition                                       */
/*----------------------------------------------------------------------*/
variable "cloudmap_parameters" {
  type        = any
  description = "CloudMap parameters to declare Namespaces."
  default     = {}
}

variable "cloudmap_defaults" {
  type        = any
  description = "Default values merged into each entry of cloudmap_parameters."
  default     = {}
}

variable "vpc_parameter" {
  type        = any
  description = "VPC wrapper output map used to resolve vpc_id by key reference."
  default     = {}
}
