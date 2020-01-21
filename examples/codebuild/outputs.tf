output "codebuild_id" {
  value       = "${module.this.codebuild_id}"
  description = "The arn of the lambda"
}

output "role_arn" {
  value       = "${module.this.role_arn}"
  description = "The arn of the role assigned to the lambda"
}
