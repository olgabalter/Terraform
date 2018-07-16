provider "vra7" {
    username	= "${var.username}"
    password 	= "${var.password}"
    tenant	= "${var.tenant}"
    host	= "${var.host}"
    insecure	= "true"
}

resource "null_resource" "create-time" {
    triggers {
        now		= "${var.current_time}"
    }
    provisioner "local-exec" {
        command		= "mkdir -p ${var.current_time}"
        working_dir	= "/root/terraform-projects/terraform_output"

    }
}

resource "null_resource" "destroy-time" {
    triggers {
        now		= "${var.current_time}"
    }
    provisioner "local-exec" {
        when            = "destroy"
        command		= "mkdir -p ${var.current_time}"
        working_dir	= "/root/terraform-projects/terraform_output"

    }
}


module "vegas-prod-ace-game-service" {
    source		= "../modules/cluster-resource/" 

    prefix		= "${var.prefix}"
    catalog_name	= "${var.catalog_name}"
    suffix		= "${var.suffix}"
    count		= 2
    cluster_name	= "ace-game-service"
    current_time	= "${var.current_time}"
}

module "vegas-prod-coupon-game-service" {
    source		= "../modules/cluster-resource/" 

    prefix		= "${var.prefix}"
    catalog_name	= "${var.catalog_name}"
    suffix		= "${var.suffix}"
    count		= 1
    cluster_name	= "coupon-game-service"
    current_time	= "${var.current_time}"
}
