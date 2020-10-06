## Copyright (c) 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "random_string" "wallet_password" {
  length  = 16
  special = true
}

data "oci_database_autonomous_database_wallet" "hr_prod_wallet" {
  autonomous_database_id = oci_database_autonomous_database.hr_prod_atp.id
  password               = random_string.wallet_password.result
  base64_encode_content  = "true"
}

output "hr_prod_wallet_password" {
  value = [random_string.wallet_password.result]
}