## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaajznex5attydtrmrgudwayqu7kn4krasw2ct4h4pwz7nwbfxoyd4q"
  }
variable "compartment_ocid" {
  default =  "ocid1.compartment.oc1..aaaaaaaamtrs5i5sm6b4ie2uchhjlu6jxp3oehi5y4b6hp34pqpcffpkdzja"
}
variable "user_ocid" {
  default = "ocid1.user.oc1..aaaaaaaao7mct2dugqn6ymsm2mncrthv2q2zcbh7emcgwmckswmaiboiargq"
}
variable "fingerprint" {
  default = "5a:b6:9a:f1:4b:47:43:53:e5:a2:38:f9:5d:5d:e7:39"
}
variable "private_key_path" {
  default = "~/.oci/chip_private.pem "
}
variable "region" {
  default = "us-ashburn-1"
}



variable "app_name" {
  default = "test"
}


variable "release" {
  description = "Reference Architecture Release (OCI Architecture Center)"
  default     = "1.0.3"
}



# variables for dynamic group
# variable for ocid of compartment that holds OKE cluster
variable "node_compartment_ocid" {
    type = string
    default = ""
}
variable "dynamic_group_name" {
    type = string
    default = "mesh_osok"
}
variable "dynamic_group_description" {
    type = string
    default = "osok dynamic group"
}


# variables for Polciy for Dynamic Group to allow OSOK Operations
# variable for ocid of compartment that holds OKE cluster

variable "policy_description" {
    type = string
    default = "policy to allow OSOK operation"
}

variable "policy_name" {
    type = string
    default = "osok_policy"
}



variable "tenancy_ocid_osok" {
  default =  ""
  type = string
}








