module "this" {
  source                    = "../../"
  codebuild_name            = "test"
  codebuild_description     = "test"
  codebuild_build_timeout   = 480
  environment               = "prod"
  product_domain            = "ops"
  ecr_image_name            = ""
  codebuild_buildspec       = ""
  codebuild_github_location = ""

  iam_policy_document = ""
}
