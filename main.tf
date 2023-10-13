locals {
  zone = var.instances_zone
  instances = [for name in var.instances : "zones/${local.zone}/instances/${name}"]
  prefixes = var.instance_prefix
}

resource "google_os_config_patch_deployment" "sandbox-deployment" {

  project = var.project
  patch_deployment_id = var.patch_deployment_id

   instance_filter {
        instances = local.instances
        instance_name_prefixes = local.prefixes
    }

    patch_config {
        
        reboot_config = var.reboot_config

        yum {
        minimal = var.minimal
        security = var.security
        excludes = var.excludes
        exclusive_packages = var.exclusive_packages
        }

        windows_update {
          classifications = var.classifications
        }

    }
  
    duration = var.duration

    recurring_schedule {

        time_zone {
        id = var.time_zone
        }

        time_of_day {
        hours = var.time_of_day[0]
        minutes = var.time_of_day[1]
        seconds = var.time_of_day[2]
        nanos = var.time_of_day[3]
        }

        monthly {
        month_day = var.month_day
        }
    }

}



