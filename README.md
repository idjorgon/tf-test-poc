## Description

The intention behind this poc repo is illustrative and its intent is to demonstrate some of the capabilities of the new terrafrom test framework.
It is not a comparative analysis in any way and does not make judgements vis-a-vis terratest or tf2 vs terrafrom test framework.

We are provisioning a simple storage account in Azure and testing/asserting for variables validation and different storage account attributes. 
Note that the test file `main.tftest/hcl` lives within the `tests` folder.

## Prerequisites

1. Download and install [Visual Studio Code](https://code.visualstudio.com/download)
2. You will need a Microsoft Azure subscription (you should be able to request and obtain one from Slalom)
3. Install [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
4. Install latest version of [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

Read more about the new Terrafrom Test Framework [here](https://www.hashicorp.com/blog/terraform-1-6-adds-a-test-framework-for-enhanced-code-validation), which is generally available as of Terraform 1.6


## Azure Setup

There are a couple of different ways you can authenticate and sign in to Azure. I used the following method to sign in and set the proper subscription:

1. Run the `az login` command and proceed to sign in with your account credentials in the browser
2. After you sign in, CLI commands are run against your default subscription; if you have multiple subscriptions, you can change your default subscription using `az account set --subscription`

Read more about signing in to Azure [here](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli), and managing subscriptions [here](https://learn.microsoft.com/en-us/cli/azure/manage-azure-subscriptions-azure-cli)

## Running Tests

1. CD into the storage folder directory
2. From within the storage directory, type `terraform test` in the terminal
3. This will execute the terraform tests and subsequently tear down test resources

If everything was setup correctly you should get the following upon running `terraform test`:

```
tests/main.tftest.hcl... in progress
  run "storage_account_variables_validation"... pass
  run "setup"... pass
  run "storage_account_attribute_actual_vs_expected_test"... pass
tests/main.tftest.hcl... tearing down
tests/main.tftest.hcl... pass
```
