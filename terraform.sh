#!/bin/bash

pushd $PWD

dir=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)

cd /tmp

echo "Cloning bitpesa Terraform repository"
echo "============================================"

git clone git@github.com:bitpesa/bitpesa-terraform.git || true

popd

pushd  $PWD
echo "Test"
echo "============================================"

cd tmp/bitpesa-terraform/

ls

popd
