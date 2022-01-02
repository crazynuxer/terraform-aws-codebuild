data "aws_caller_identity" "current" {}

module "codebuild_role" {
  source = "github.com/crazynuxer/terraform-aws-iam-role//modules/service?ref=v0.6.0"
  role_identifier   = "${var.product_domain}"
  role_description = "${var.codebuild_name}"
  aws_service = "codebuild.amazonaws.com"
}

resource "aws_iam_role_policy" "codebuild_additional_policy" {
  name   = "${var.codebuild_name}"
  role   = "${module.codebuild_role.role_name}"
  policy = "${var.iam_policy_document}"
  count  = "${length(var.iam_policy_document) > 0 ? 1 : 0}"
}

module "random_id" {
  source = "github.com/crazynuxer/terraform-aws-resource-naming?ref=v0.8.0"
  name_prefix   = "${var.product_domain}-${var.codebuild_name}"
  resource_type = "codebuild_project"
}

locals {
  default_tags = {
    Name          = "${var.codebuild_name}"
    Environment   = "${var.environment}"
    ProductDomain = "${var.product_domain}"
    Description   = "${var.codebuild_description}"
    ManagedBy     = "Terraform"
  }
}

resource "aws_codebuild_project" "codebuild" {
  build_timeout = "${var.codebuild_build_timeout}"
  description   = "${var.codebuild_description}"
  name          = "${var.codebuild_name}"
  service_role  = "${module.codebuild_role.role_arn}"
  tags          = {}

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "${var.ecr_image_name}"
    privileged_mode             = false
    type                        = "LINUX_CONTAINER"
  }

  source {
    buildspec           = "${var.codebuild_buildspec}"
    git_clone_depth     = 1
    insecure_ssl        = false
    location            = "${var.codebuild_github_location}"
    report_build_status = false
    type                = "GITHUB"
  }
}

