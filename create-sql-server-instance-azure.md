# Create a SQL Server instance on Microsoft Azure

Note: this is an optional step that you can try on your own free of charge using the Microsoft Azure subscription that you get through IBU. In the step-by-step instructions here, where any name contains the string `"jsmith1234"`, replace it with your own unique name stem by taking your IBU email and removing the "." and the "@ibu.ca" from it.

1. Login to [https://portal.azure.com](https://portal.azure.com) with your IBU student credentials and select SQL Server from the list of available services.
![Step 1 - select SQL Server](./images/azure-01-sql-server.png)

2. Expand `All Resources` > `Azure SQL Database` > `SQL logical servers` and click on `Create`.
![Step 2 - create SQL server](./images/azure-02-create-sql-server.png)

3. Pick the following options:
    1. select `Azure for Students` as the subscription
    1. create a new Resource Group `rg-jsmith1234`)
    1. name the server `srv-jsmith1234`
    1. pick `US West 3` for the location (note: you might have to pick a different US or Canadian location)
    1. for authentication, select `Use SQL authentication`
    1. pick `dbadmin` as your server admin login, and pick a password.
![Step 3 - configure SQL Server instance](./images/azure-03-create-db-server-01-basics.png)

4. In the next step, choose `Yes` in the Firewall rules screen.
![Step 4 - firewall rules](./images/azure-03-create-db-server-02-networking.png)

5. In the next step, `Security`, you can leave the default options.
![Step 5 - Security](./images/azure-03-create-db-server-03-security.png)

6. In the next step, `Additional settings`, select `Not now`.
![Step 6 - Additional settings](./images/azure-03-create-db-server-04-additional-settings.png)

7. In the next step, `Tags`, you can leave it empty.
![Step 7 - Tags](./images/azure-03-create-db-server-05-tags.png)

8. In the final step, check and confirm the settings.
![Step 8 - check and confirm](./images/azure-03-create-db-server-06-review.png)

9. Wait for the validation step to complete
![Step 9 - validation](./images/azure-03-create-db-server-07-validating.png)

10. Once the validation and deployment is complete, click on `Go to resource`.
![Step 10 - navigate to resource](./images/azure-03-create-db-server-08-complete.png)