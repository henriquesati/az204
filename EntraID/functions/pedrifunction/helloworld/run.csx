using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Http;

public static IActionResult Run(HttpRequest req, ILogger log)
{
    log.LogInformation("HelloWorld function processed a request.");

    string name = req.Query["name"];

    if (string.IsNullOrWhiteSpace(name))
    {
        name = "world";
    }

    return new OkObjectResult($"Hello, {name}!");
}