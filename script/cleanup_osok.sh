#!/bin/bash


# un-install OSOK Operator
./operator-sdk cleanup oci-service-operator

#check if OLM installed and uninstall if present

 
./operator-sdk olm uninstall


