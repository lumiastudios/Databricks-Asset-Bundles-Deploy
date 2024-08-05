# Databricks Asset Bundles Deploy GitHub Action

**Deploy Databricks asset bundles using the Databricks CLI.**

## Overview

This GitHub Action automates the deployment of Databricks asset bundles using the Databricks CLI. It supports multiple authentication methods and integrates seamlessly into your CI/CD pipelines.

## Features

- Deploy Databricks asset bundles
- Supports various authentication methods:
  - Personal Access Token
  - OAuth
  - Azure Managed Identity
  - Microsoft Entra ID
  - Google Cloud Credentials

## Inputs

- **`working-directory`**: The directory containing the Databricks asset bundle configuration (required).
- **`databricks-host`**: The Databricks workspace host URL (required).
- **`databricks-bundle-env`**: The target environment for the Databricks asset bundle deployment (required).
- **`authentication-type`**: The type of authentication to use (`token`, `oauth`, `azure-managed-identity`, `microsoft-entra-id`, `google-credentials`). Default is `token` (required).
- **`databricks-token`**: Databricks personal access token for authentication (optional, required if `authentication-type` is `token`).
- **`databricks-client-id`**: Databricks OAuth client ID for authentication (optional, required if `authentication-type` is `oauth`).
- **`databricks-client-secret`**: Databricks OAuth client secret for authentication (optional, required if `authentication-type` is `oauth`).
- **`arm-client-id`**: Azure Managed Identity or Microsoft Entra ID client ID (optional, required if `authentication-type` is `azure-managed-identity` or `microsoft-entra-id`).
- **`arm-client-secret`**: Microsoft Entra ID client secret (optional, required if `authentication-type` is `microsoft-entra-id`).
- **`arm-tenant-id`**: Microsoft Entra ID tenant ID (optional, required if `authentication-type` is `microsoft-entra-id`).
- **`google-credentials`**: Google Cloud credentials for authentication (optional, required if `authentication-type` is `google-credentials`).

## Usage

Add this action to your GitHub workflow file (e.g., `.github/workflows/deploy.yml`) to deploy your Databricks asset bundle.

### Example Workflow

```yaml
name: Deploy Databricks Asset Bundle

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Deploy Asset Bundle
        uses: lumiastudios/databricks-asset-bundles-deploy@v1.0.0
        with:
          working-directory: ./databricks-bundle
          databricks-host: https://my-databricks-workspace.databricks.com
          databricks-bundle-env: production
          authentication-type: token
          databricks-token: ${{ secrets.DATABRICKS_TOKEN }}
```

## Authentication Types
- Token: Use `databricks-token`.
- OAuth: Use `databricks-client-id` and `databricks-client-secret`.
- Azure Managed Identity: Use `arm-client-id`.
- Microsoft Entra ID: Use `arm-client-id`, `arm-client-secret`, and `arm-tenant-id`.
- Google Credentials: Use `google-credentials`.

## Contributing

Feel free to open issues or submit pull requests to improve this action. For detailed contribution guidelines, please refer to our [CONTRIBUTING.md](CONTRIBUTING.md).

## License

This project is licensed under the [Apache License 2.0](LICENSE).