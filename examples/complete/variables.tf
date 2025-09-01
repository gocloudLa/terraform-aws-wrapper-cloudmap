/*----------------------------------------------------------------------*/
/* Common |                                                             */
/*----------------------------------------------------------------------*/

# variable "metadata" {
#   type = any
# }

/*----------------------------------------------------------------------*/
/* CloudMap | Variable Definition                                       */
/*----------------------------------------------------------------------*/
variable "cloudmap_parameters" {
  type        = any
  description = "CloudMap parameteres to declare Namespaces"
  default     = {}
}

variable "cloudmap_defaults" {
  type        = any
  description = "CloudMap default parameteres to declare Namespaces"
  default     = {}
}