output "codebuild_id" {
  value = "${aws_codebuild_project.codebuild.id}"
}

output "role_arn" {
  value       = "${module.codebuild_role.role_arn}"
  description = "The arn of the role assigned to the codebuild"
}
