# Patch Deployment Module

This module makes it easy to deploy new deployments to the GCP VM Manager for Centos and Windows servers patches.

This module will create/trigger 

- Patch deployment for one or more VM instances

## Usage

---

Basic usage of this module is as follows: 

```bash
module "patch_management" {
    source = "github.com/asrinandirin/os_patch_management/"
    project = "<project-id>"
    patch_deployment_id = "my-patch-deployment"
    instances = ["instance-1,<instance-zone1>","instance_2,<instance-zone2>"]
    // Centos patch configs
    security = "true"
    minimal = "false"
    // Windows patch configs
    classifications = ["CRITICAL","SECURITY"]
    time_of_day = [0, 30, 0, 0] 
    reboot_config = "NEVER"
    duration = "5000s"
}
```

 

## Inputs

---

| Name | Description | Type | Default | Required |
| --- | --- | --- | --- | --- |
| patch_deployment_id | A name for the patch deployment in the project. | string | n/a | yes |
| project | Project for deploying patch deployment. | string | n/a | yes |
| instances | Target instances,instance-zone | list(string) | {} | yes |
| instances_prefix | Prefix of instances that will be updated | list(string) | {} | no |
| security | Adds the --security flag to yum update. Not supported on all platforms. | bool | true | yes |
| minimal | Will cause patch to run yum update-minimal instead. | bool | false | no |
| excludes | List of packages to exclude from update. These packages will be excluded. | list(string) | {} | no |
| exclusive_packages | An exclusive list of packages to be updated. | list(string) | {} | no |
| classifications | Only apply updates of these windows update classifications | list(string) | {} | no |
| Duration | Duration of the patch. After the duration ends, the patch times out | string | “5600s” | no |
| reboot_config | Post-patch reboot settings | string | “NEVER” | no |
| time_zone | Defines the time zone that timeOfDay is relative to | string | “Europe/Istanbul” | no |
| time_of_day | Time of the day to run a recurring deployment. H/M/S/N | list(number) | [0,30,0,0] | no |
| month_of_day | Month of the day to update packages | number | 2 | no |

## Requirements

---

These sections describe requirements for using this module.

With this module, you can only create deployments for Windows and Centos servers. For Windows servers, you are unable to use exclude blocks. 

The following dependencies must be available:

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13.0
    - For Terraform v0.11 see the [Compatibility](https://github.com/terraform-google-modules/terraform-google-cloud-storage#compatibility) section above
- [Terraform Provider for GCP](https://www.terraform.io/docs/providers/google/index.html) plugin >= v4.42

### Service Account

---

A service account with **PatchDeployment Admin** role.