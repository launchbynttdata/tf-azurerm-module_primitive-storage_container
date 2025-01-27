package testimpl

import (
	"context"
	"os"
	"strings"
	"testing"

	"github.com/Azure/azure-sdk-for-go/sdk/azcore"
	"github.com/Azure/azure-sdk-for-go/sdk/azcore/arm"
	"github.com/Azure/azure-sdk-for-go/sdk/azcore/cloud"
	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	armStorage "github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/storage/armstorage"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestComposableComplete(t *testing.T, ctx types.TestContext) {
	subscriptionId := os.Getenv("ARM_SUBSCRIPTION_ID")
	if len(subscriptionId) == 0 {
		t.Fatal("ARM_SUBSCRIPTION_ID environment variable is not set")
	}

	credential, err := azidentity.NewDefaultAzureCredential(nil)
	if err != nil {
		t.Fatalf("Unable to get credentials: %e\n", err)
	}

	options := arm.ClientOptions{
		ClientOptions: azcore.ClientOptions{
			Cloud: cloud.AzurePublic,
		},
	}

	storageAccountClient, err := armStorage.NewAccountsClient(subscriptionId, credential, &options)
	if err != nil {
		t.Fatalf("Error getting Storage Account client: %v", err)
	}

	storageContainerClient, err := armStorage.NewBlobContainersClient(subscriptionId, credential, &options)
	if err != nil {
		t.Fatalf("Error getting Storage Container client: %v", err)
	}

	resourceGroupName := terraform.Output(t, ctx.TerratestTerraformOptions(), "resource_group_name")
	storageAccountName := terraform.Output(t, ctx.TerratestTerraformOptions(), "storage_account_name")
	storageContainerName := terraform.Output(t, ctx.TerratestTerraformOptions(), "container_name")

	t.Run("doesStorageAccountExist", func(t *testing.T) {
		storageAccount, err := storageAccountClient.GetProperties(context.Background(), resourceGroupName, storageAccountName, nil)
		if err != nil {
			t.Fatalf("Error getting storage account: %v", err)
		}

		assert.Equal(t, getStorageAccountName(*storageAccount.Name), strings.Trim(getStorageAccountName(storageAccountName), "]"))
	})

	t.Run("doesStorageContainerExist", func(t *testing.T) {
		storageContainer, err := storageContainerClient.Get(context.Background(), resourceGroupName, storageAccountName, storageContainerName, nil)
		if err != nil {
			t.Fatalf("Error getting storage container: %v", err)
		}

		assert.Equal(t, *storageContainer.Name, storageContainerName)
		assert.False(t, *storageContainer.ContainerProperties.Deleted, "Expected container to not be deleted")
	})
}

func getStorageAccountName(input string) string {
	parts := strings.Split(input, "/")
	return parts[len(parts)-1]
}
