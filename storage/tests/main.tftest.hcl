variables {
  resource_name            = "stdemo2023"
  resource_group_name      = "rg-storage"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

provider "azurerm" {
    features {}
}

run storage_account_variables_validation {
    command = plan

    variables {
        resource_name            = "stdemo2023"
        resource_group_name      = "rg-storage"
        location                 = "eastus"
        account_tier             = "General-Purpose v2"
        account_replication_type = "ZRS"
    }

    expect_failures = [
        var.account_replication_type,
        var.account_tier
    ]
}

run setup {
    command = apply

    variables {
        resource_group_name = "rg-storage"
        location            = "eastus"
    }

    module {
        // Starting from tests dir
        source              = "./tests/setup"
    }
}

run storage_account_attribute_actual_vs_expected_test {
    command = plan

    variables {
        resource_group_name      = run.setup.resource_group_name
        location                 = var.location
        resource_name            = var.resource_name
        account_tier             = var.account_tier
        account_replication_type = var.account_replication_type
    }

    assert {
        condition = azurerm_storage_account.storage.name == var.resource_name
        error_message = "storage account name does not match with the given variable value"
    }

    assert {
        condition = azurerm_storage_account.storage.location == var.location
        error_message = "storage account location does not match with the given variable value"
    }

    assert {
        condition = azurerm_storage_account.storage.account_tier == var.account_tier
        error_message = "storage account tier does not match with the given variable value"
    }

    assert {
        condition = azurerm_storage_account.storage.account_replication_type == var.account_replication_type
        error_message = "storage account replication type does not match with the given variable value"
    }
}