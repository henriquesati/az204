using Azure.Identity;
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;

string accountName = "pedristorage";
string containerName = "main-teste";
string blobName = "video.mp4";

var serviceClient = new BlobServiceClient(
    new Uri($"https://{accountName}.blob.core.windows.net"),
    new DefaultAzureCredential()
);

BlobContainerClient containerClient =
    serviceClient.GetBlobContainerClient(containerName);

BlobClient blobClient =
    containerClient.GetBlobClient(blobName);

await blobClient.SetAccessTierAsync(AccessTier.Archive);