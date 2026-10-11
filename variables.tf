variable "composer_user_workloads_secrets" {
  description = <<EOT
Map of composer_user_workloads_secrets, attributes below
Required:
    - environment
    - name
Optional:
    - data
    - deletion_policy
    - project
    - region
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    environment     = string
    name            = string
    data            = optional(map(string))
    deletion_policy = optional(string)
    project         = optional(string)
    region          = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

