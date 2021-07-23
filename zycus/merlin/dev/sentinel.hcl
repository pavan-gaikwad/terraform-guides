module "tfplan-functions" {
  source = "../../../governance/third-generation/common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfstate-functions" {
  source = "../../../governance/third-generation/common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "tfconfig-functions" {
  source = "../../../governance/third-generation/common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "aws-functions" {
  source = "../../../governance/third-generation/aws-functions/aws-functions.sentinel"
}
policy "restrict-ec2-instance-type" { enforcement_level = "hard-mandatory" }
policy "cost_validated" { enforcement_level = "hard-mandatory" }
