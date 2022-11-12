# Terraform Toolbox

## Scripts

## Snippets

### AWS

* [VPC](snippets/aws/vpc)
* [ALB with 3 workers](snippets/aws/alb_3_workers)
* [Web Server with Scaling Group, VPC, LB and IAM](snippets/aws/as_vpc_lb_web_iam)
* [Single EC2 instance](snippets/aws/ec2_single_instance)

## Module

* Keep them in one centralized repository (to not update/fix every in every repository you store them)

* Use tags when referencing modules. This will ensure that if one the modules is being updated, you'd still use the same version instead which leads to stability and more predictable path

* Reference module:

```
module "code_src" {
  source = "git::https://ADDRESS/orgName/_git/Modules/@Terraform_Modules/some_module?ref=~{ref}~"
}
```

* Reference module with specific tag:

```
module "code_src" {
  source = "git::https://ADDRESS/orgName/_git/Modules/@Terraform_Modules/some_module?ref=V0.1.7"
}
```
