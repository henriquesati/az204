#!/bin/bash

az ad user create \
    --display-name "pedri" \
    --password "password@1" \
    --user-principal-name "pedri@paulhinyhotmail.onmicrosoft.com"