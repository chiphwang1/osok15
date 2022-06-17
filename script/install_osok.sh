#!/bin/bash

# Set platform information
export ARCH=$(case $(uname -m) in x86_64) echo -n amd64 ;; aarch64) echo -n arm64 ;; *) echo -n $(uname -m) ;; esac)
export OS=$(uname | awk '{print tolower($0)}')
export KUBECONFIG=/tmp/kubeconfig

# Download Binary
export OPERATOR_SDK_DL_URL=https://github.com/operator-framework/operator-sdk/releases/download/v1.22.0
curl -LO ${OPERATOR_SDK_DL_URL}/operator-sdk_${OS}_${ARCH}

# Import the operator-sdk release GPG key from keyserver.ubuntu.com
gpg --keyserver keyserver.ubuntu.com --recv-keys 052996E2A20B5C7E

# Download the checksums file and its signature, then verify the signature:
curl -LO ${OPERATOR_SDK_DL_URL}/checksums.txt
curl -LO ${OPERATOR_SDK_DL_URL}/checksums.txt.asc
gpg -u "Operator SDK (release) <cncf-operator-sdk@cncf.io>" --verify checksums.txt.asc

# Make sure the checksums match:
grep operator-sdk_${OS}_${ARCH} checksums.txt | sha256sum -c -

#Install the release binary in your PATH
chmod +x operator-sdk_${OS}_${ARCH} && mv operator-sdk_${OS}_${ARCH} ./operator-sdk

#check if OLM installed and skip if installed


  ./operator-sdk olm install --version 0.20.0


# Verify Installation
./operator-sdk olm status

# Create Namespace oci-service-operator-system
kubectl create ns oci-service-operator-system 

# install OSOK Operator
./operator-sdk run bundle iad.ocir.io/oracle/oci-service-operator-bundle:1.1.0 -n oci-service-operator-system --timeout 10m

