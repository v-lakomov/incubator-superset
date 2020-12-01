#!/bin/bash

pushd $PWD

dir=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)

cd /tmp

echo "Cloning bitpesa Terraform repository"
echo "============================================"

git clone -b BTA-4825-superset-deployment git@github.com:bitpesa/bitpesa-terraform.git || true

popd

pushd  $PWD
echo "Test"
echo "============================================"

cd /tmp/bitpesa-terraform/

ls

popd
