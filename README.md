# Standard Platform - Terraform Module 🚀🚀
<p align="right"><a href="https://partners.amazonaws.com/partners/0018a00001hHve4AAC/GoCloud"><img src="https://img.shields.io/badge/AWS%20Partner-Advanced-orange?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS Partner"/></a><a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-green?style=for-the-badge&logo=apache&logoColor=white" alt="LICENSE"/></a></p>

Welcome to the Standard Platform — a suite of reusable and production-ready Terraform modules purpose-built for AWS environments.
Each module encapsulates best practices, security configurations, and sensible defaults to simplify and standardize infrastructure provisioning across projects.

## 📦 Module: Terraform CloudMap Module
<p align="right"><a href="https://github.com/gocloudLa/terraform-aws-wrapper-cloudmap/releases/latest"><img src="https://img.shields.io/github/v/release/gocloudLa/terraform-aws-wrapper-cloudmap.svg?style=for-the-badge" alt="Latest Release"/></a><a href=""><img src="https://img.shields.io/github/last-commit/gocloudLa/terraform-aws-wrapper-cloudmap.svg?style=for-the-badge" alt="Last Commit"/></a><a href="https://registry.terraform.io/modules/gocloudLa/wrapper-cloudmap/aws"><img src="https://img.shields.io/badge/Terraform-Registry-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform Registry"/></a></p>
Provision and manage AWS Cloud Map private DNS namespaces at scale, with per-namespace VPC association, opinionated tagging, and native integration with the GoCloud VPC wrapper.


### ✨ Features

- 🗺️ [Private DNS Namespace Management](#private-dns-namespace-management) - Create and manage multiple AWS Cloud Map private DNS namespaces with a single for_each block.

- 🔗 [Flexible VPC Association](#flexible-vpc-association) - Associate each namespace with a VPC by direct ID or by key reference into the VPC wrapper output.




## 🚀 Quick Start
```hcl
cloudmap_parameters = {
  "project1.${local.zone_internal}" = {
    vpc = "networking"
    # Or: vpc_id = "vpc-xxxxxxxxxxxxxx"
  }
  "project2.${local.zone_internal}" = {
    vpc = "networking"
  }
}
```


## 🔧 Additional Features Usage

### Private DNS Namespace Management
Each key in `cloudmap_parameters` becomes an `aws_service_discovery_private_dns_namespace` resource. Defaults from `cloudmap_defaults` are merged into every entry via a `try()` chain, keeping per-namespace overrides minimal.


<details><summary>Two namespaces sharing a default VPC</summary>

```hcl
cloudmap_parameters = {
  "project1.${local.zone_internal}" = {
    vpc = "networking"
  }
  "project2.${local.zone_internal}" = {
    vpc = "networking"
  }
}

cloudmap_defaults = {
  tags = { team = "platform" }
}
```


</details>


### Flexible VPC Association
Each namespace entry accepts either a literal `vpc_id` string or a `vpc` key that is resolved against `vpc_parameter.vpcs[vpc].vpc_id`. This allows the example to be self-contained with a placeholder while production configs wire in `module.wrapper_vpc.vpcs` directly.


<details><summary>Direct vpc_id vs. key reference</summary>

```hcl
cloudmap_parameters = {
  "services.${local.zone_internal}" = {
    vpc_id = "vpc-xxxxxxxxxxxxxx"  # Direct
  }
  "infra.${local.zone_internal}" = {
    vpc = "networking"  # Resolved via vpc_parameter.vpcs
  }
}

vpc_parameter = {
  vpcs = {
    networking = { vpc_id = "vpc-xxxxxxxxxxxxxx" }
  }
}
```


</details>




## 📑 Inputs
| Name   | Description                                                    | Type          | Default | Required |
| ------ | -------------------------------------------------------------- | ------------- | ------- | -------- |
| vpc_id | VPC ID to associate with the private DNS namespace.            | `string`      | `null`  | no       |
| vpc    | Key into `vpc_parameter.vpcs` used to resolve the VPC ID.      | `string`      | `null`  | no       |
| tags   | Map of additional tags to merge with the common resource tags. | `map(string)` | `{}`    | no       |







## ⚠️ Important Notes
- ⚠️ **VPC association is required:** each namespace entry must supply either `vpc_id` or `vpc` (a key into `vpc_parameter.vpcs`). Omitting both will cause a `try()` evaluation error at plan time.
- ℹ️ **VPC wrapper integration:** pass `vpc_parameter = { vpcs = module.wrapper_vpc.vpcs }` to avoid hardcoding VPC IDs and keep configs portable across environments.



---

## 🤝 Contributing
We welcome contributions! Please see our contributing guidelines for more details.

## 🆘 Support
- 📧 **Email**: info@gocloud.la

## 🧑‍💻 About
We are focused on Cloud Engineering, DevOps, and Infrastructure as Code.
We specialize in helping companies design, implement, and operate secure and scalable cloud-native platforms.
- 🌎 [www.gocloud.la](https://www.gocloud.la)
- ☁️ AWS Advanced Partner (Terraform, DevOps, GenAI)
- 📫 Contact: info@gocloud.la

## 📄 License
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details. 