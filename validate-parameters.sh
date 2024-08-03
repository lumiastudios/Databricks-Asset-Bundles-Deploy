#!/bin/sh

if [[ "$AUTHENTICATION_TYPE" == "token" ]]; then
  if [[ -z "$DATABRICKS_TOKEN" ]]; then
    echo "Error: 'DATABRICKS_TOKEN' must be provided when 'AUTHENTICATION_TYPE' is 'token'."
    exit 1
  fi
elif [[ "$AUTHENTICATION_TYPE" == "oauth" ]]; then
  if [[ -z "$DATABRICKS_CLIENT_ID" || -z "$DATABRICKS_CLIENT_SECRET" ]]; then
    echo "Error: Both 'DATABRICKS_CLIENT_ID' and 'DATABRICKS_CLIENT_SECRET' must be provided when 'AUTHENTICATION_TYPE' is 'oauth'."
    exit 1
  fi
elif [[ "$AUTHENTICATION_TYPE" == "azure-managed-identity" ]]; then
  if [[ -z "$ARM_CLIENT_ID" ]]; then
    echo "Error: 'ARM_CLIENT_ID' must be provided when 'AUTHENTICATION_TYPE' is 'azure-managed-identity'."
    exit 1
  fi
elif [[ "$AUTHENTICATION_TYPE" == "microsoft-entra-id" ]]; then
  if [[ -z "$ARM_CLIENT_ID" || -z "$ARM_CLIENT_SECRET" || -z "$ARM_TENANT_ID" ]]; then
    echo "Error: 'ARM_CLIENT_ID', 'ARM_CLIENT_SECRET', and 'ARM_TENANT_ID' must be provided when 'AUTHENTICATION_TYPE' is 'microsoft-entra-id'."
    exit 1
  fi
elif [[ "$AUTHENTICATION_TYPE" == "google-credentials" ]]; then
  if [[ -z "$GOOGLE_CREDENTIALS" ]]; then
    echo "Error: 'GOOGLE_CREDENTIALS' must be provided when 'AUTHENTICATION_TYPE' is 'google-credentials'."
    exit 1
  fi
else
  echo "Error: 'AUTHENTICATION_TYPE' must be one of 'token', 'oauth', 'azure-managed-identity', 'microsoft-entra-id', or 'google-credentials'."
  exit 1
fi
