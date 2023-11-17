## Prerequisites

1. Install Visual Studio Code
2. You will need a Microsoft Azure Subscription (you should be able to request one from Slalom)
3. [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Setup & Running Tests

1. CD into the storage folder dir
2. From within the storage dir, type `terraform test` in the terminal
3. This will execute the terraform tests and subsequently tear down resources

As an illustration, if everything was setup correctly you should get the following upon running `terraform test`:

```
tests/main.tftest.hcl... in progress
  run "storage_account_variables_validation"... pass
  run "setup"... pass
  run "storage_account_attribute_actual_vs_expected_test"... pass
tests/main.tftest.hcl... tearing down
tests/main.tftest.hcl... pass
```
