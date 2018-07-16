resource "vra7_resource" "vegas-prod" {
    catalog_name = "${var.catalog_name}"
    resource_configuration = {
        vSphere__vCenter__Machine_1.Custom.Hostname = "${var.prefix}-${var.cluster_name}${count.index}"
        vSphere__vCenter__Machine_1.Custom.Zone = "${var.suffix}"
    }
    count = "${var.count}"

    provisioner "local-exec" {
        command         = "echo ${self.resource_configuration.vSphere__vCenter__Machine_1.Custom.Hostname}.${var.suffix} >> created_${var.prefix}-${var.cluster_name}.txt"
        working_dir     = "/root/terraform-projects/terraform_output/${var.current_time}"
    }

    provisioner "local-exec" {
        when 		= "destroy"
        command		= "echo ${self.resource_configuration.vSphere__vCenter__Machine_1.Custom.Hostname}.${var.suffix} >> destroyed_${var.prefix}-${var.cluster_name}.txt"
        working_dir	= "/root/terraform-projects/terraform_output/${var.current_time}"
    }
}
