using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using SetupWizard.API.Models;

namespace SetupWizard.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        private readonly string _connectionString;

        public UsersController(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        [HttpGet]
        public async Task<IActionResult> GetUsers()
        {
            try
            {
                using var connection = new SqlConnection(_connectionString);
                await connection.OpenAsync();

                string query = "SELECT Id, Username, Email, CreatedDate FROM Users";
                using var command = new SqlCommand(query, connection);
                using var reader = await command.ExecuteReaderAsync();

                var users = new List<object>();
                while (await reader.ReadAsync())
                {
                    users.Add(new
                    {
                        //Id = reader.GetInt32("Id"),
                        //Username = reader.GetString("Username"),
                        //Email = reader.GetString("Email"),
                        //CreatedDate = reader.GetDateTime("CreatedDate")
                    });
                }

                return Ok(users);
            }
            catch (Exception ex)
            {
                return BadRequest($"Error: {ex.Message}");
            }
        }

        [HttpPost]
        public async Task<IActionResult> CreateUser([FromBody] CreateUserRequest request)
        {
            try
            {
                using var connection = new SqlConnection(_connectionString);
                await connection.OpenAsync();

                string query = "INSERT INTO Users (Username, Email) VALUES (@Username, @Email)";
                using var command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Username", request.Username);
                command.Parameters.AddWithValue("@Email", request.Email);

                await command.ExecuteNonQueryAsync();
                return Ok("User created successfully");
            }
            catch (Exception ex)
            {
                return BadRequest($"Error: {ex.Message}");
            }
        }
    }
}
