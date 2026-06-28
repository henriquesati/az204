using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Azure.Identity;
using Azure.Storage.Blobs;
using System.Reflection.Metadata;



namespace compfunctions
{
    public static class authstorage
    {
        private const string AccountName = "pedristorage";

        private static BlobServiceClient GetBlobServiceClient(string accountName)
        {
            return new BlobServiceClient(
                new Uri($"https://{accountName}.blob.core.windows.net"),
                new DefaultAzureCredential());
        }

        [FunctionName("authstorage")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("C# HTTP trigger function processed a request.");

            string name = req.Query["name"];

            BlobServiceClient my_service = GetBlobServiceClient(AccountName);
            BlobContainerClient my_container = my_service.GetBlobContainerClient("main-teste");
            await my_container.CreateIfNotExistsAsync();
            BlobClient my_blob = my_container.GetBlobClient("pedrinames");
            my_blob.Upload(BinaryData.FromString(name), overwrite: true);


            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            dynamic data = JsonConvert.DeserializeObject(requestBody);
            name = name ?? data?.name;

            string responseMessage = string.IsNullOrEmpty(name)
                ? "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response."
                : $"Hello, {name}. This HTTP triggered function executed successfully.";

            return new OkObjectResult(responseMessage);
        }
    }
}
