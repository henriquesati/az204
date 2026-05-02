#!/bin/bash
RG="main-testing"
STORAGE="/subscriptions/c453db49-799d-4154-bc6d-95fdde74484e/resourceGroups/DefaultResourceGroup-CCAN/providers/Microsoft.Storage/storageAccounts/pedristore"
FUNC="pedrifunction"


echo "$RG" "$STORAGE" "$FUNC"
az functionapp create \
  --resource-group "$RG" \
  --consumption-plan-location "brazilsouth" \
  --runtime dotnet \
  --runtime-version 8 \
  --functions-version 4 \
  --name "$FUNC" \
  --storage-account "$STORAGE"

