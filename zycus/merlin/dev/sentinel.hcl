module "tfplan-functions" {
  source = "./common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfstate-functions" {
  source = "./common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "tfconfig-functions" {
  source = "./common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "aws-functions" {
  source = "./aws/aws-functions/aws-functions.sentinel"
}
policy "restrict-ec2-instance-type" { enforcement_level = "hard-mandatory" }
policy "validate-providers-from-desired-regions" { enforcement_level = "hard-mandatory" }
policy "cost_validated" { enforcement_level = "hard-mandatory" }
