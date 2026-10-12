# Manage infrastructure with Terraform

*Go back to [main](./README.md#6-exercise-1---creating-a-database-server-on-azure)*.

Note: this is an advanced option intended for anyone who is proficient with Azure, Azure CLI and Terraform, allowing them to deploy and decommission the infrastructure for this workshop with Terraform. 

**IMPORTANT**: Remember to read the script and replace the values in the `locals` section.

1. Ensure you have the [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/?view=azure-cli-latest) and [sign in](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli-interactively?view=azure-cli-latest)

2. Ensure you have [Terraform](https://developer.hashicorp.com/terraform/install) installed and available on your path.

3. Download the Terraform [script](./terraform/main.tf) and update values in the `locals` section.

4. Deploy the infrastructure.
    ```cmd
    echo off
	REM 1. ensure providers are available
    terraform init

    REM 2. validate the script
    terraform validate

    REM 3. check the plan before deployment
    terraform plan

    REM 4. if all good so far, deploy!
    terraform apply

    pause
	```

5. Once you are done with this exercise, you can decommission the infrastructure. **Important**: Remember, this deletes the database AND the SQL Server instance you created so ensure you have not created any other databases on the same SQL Server instance! **Use at your own risk!**
    ```cmd
    echo off
	REM remove the deployment and all data - THIS IS PERMANENT!
    terraform destroy

    pause
    ```
