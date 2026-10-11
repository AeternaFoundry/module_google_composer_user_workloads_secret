resource "google_composer_user_workloads_secret" "composer_user_workloads_secrets" {
  for_each = var.composer_user_workloads_secrets

  environment     = each.value.environment
  name            = each.value.name
  data            = each.value.data
  deletion_policy = each.value.deletion_policy
  project         = each.value.project
  region          = each.value.region

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

