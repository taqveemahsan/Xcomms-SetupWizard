using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using SetupWizard.Web.Models;
using System.Diagnostics;
using System.Text;

namespace SetupWizard.Web.Controllers;

// SetupWizard.Web/Controllers/HomeController.cs
public class HomeController : Controller
{
    private readonly string _connectionString;
    private readonly string _apiBaseUrl;

    public HomeController(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("DefaultConnection");
        _apiBaseUrl = configuration.GetValue<string>("ApiBaseUrl");
    }

    public async Task<IActionResult> Index()
    {
        try
        {
            using var httpClient = new HttpClient();
            var response = await httpClient.GetStringAsync($"{_apiBaseUrl}/api/users");
            var users = JsonConvert.DeserializeObject<List<dynamic>>(response);

            return View(users);
        }
        catch (Exception ex)
        {
            ViewBag.Error = ex.Message;
            return View(new List<dynamic>());
        }
    }

    [HttpPost]
    public async Task<IActionResult> CreateUser(string username, string email)
    {
        try
        {
            using var httpClient = new HttpClient();
            var requestData = new { Username = username, Email = email };
            var json = JsonConvert.SerializeObject(requestData);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await httpClient.PostAsync($"{_apiBaseUrl}/api/users", content);

            if (response.IsSuccessStatusCode)
            {
                TempData["Success"] = "User created successfully!";
            }
            else
            {
                TempData["Error"] = "Failed to create user";
            }
        }
        catch (Exception ex)
        {
            TempData["Error"] = ex.Message;
        }

        return RedirectToAction("Index");
    }
}