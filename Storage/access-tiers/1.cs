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

await containerClient.CreateIfNotExistsAsync();

BlobClient blobClient =
    containerClient.GetBlobClient(blobName);

await using FileStream stream = File.OpenRead("./video.mp4");

var options = new BlobUploadOptions
{
    AccessTier = AccessTier.Cool,
    HttpHeaders = new BlobHttpHeaders
    {
        ContentType = "video/mp4"
    }
};

await blobClient.UploadAsync(stream, options);