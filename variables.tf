variable "codebuild_name" {
  type        = string
  description = "codebuild  name"
}

variable "codebuild_description" {
  type        = string
  description = "Description of what the codebuild does"
  default     = ""
}

variable "codebuild_build_timeout" {
  type        = string
  description = "codebuild timeout value"
}

variable "tags" {
  type        = map
  description = "Tags associated with the lambda"
  default     = {}
}

variable "iam_policy_document" {
  type        = string
  description = "Additional policy associated with the codebuild"
}

variable "environment" {
  type        = string
  description = "The environment where the lambda is running"
}

variable "product_domain" {
  type        = string
  description = "The product domain of the lambda"
}

variable "ecr_image_name" {
  type = string
  description = "ecr repo path"
}

variable "codebuild_buildspec" {
  type = string
  description = "buildspec location for codebuild"
}

variable "codebuild_github_location" {
  type = string
  description = "github repo url"
}
