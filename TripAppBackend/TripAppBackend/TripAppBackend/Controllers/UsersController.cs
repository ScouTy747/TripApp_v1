// Inside UsersController.cs

using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TripAppBackend.Models;

namespace TripAppBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly ApiDbContext _context;

        public UsersController(ApiDbContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }



        [HttpPost("login")]
        public async Task<ActionResult<Login>> Login(Login credentials)
        {
            if (credentials == null)
            {
                return BadRequest("Invalid login request");
            }

            var user = await _context.Users
                .FirstOrDefaultAsync(u => u.UserName == credentials.LoginUserName && u.Password == HashPassword(credentials.LoginPassword));

            if (user == null)
            {
                return NotFound(); // User with the given username and password not found
            }

            return Ok(user); // User successfully authenticated
        }

        [HttpPost("register")]
        public async Task<ActionResult<Users>> Register(Users newUser)
        {
            try
            {
                if (newUser == null)
                {
                    return BadRequest("Invalid registration request");
                }

                // Ensure the user with the same username or email does not already exist
                if (_context.Users.Any(u => u.UserName == newUser.UserName || u.Email == newUser.Email))
                {
                    return Conflict("User with the same username or email already exists");
                }

                // Hash the password before saving it to the database
                newUser.Password = HashPassword(newUser.Password);

                _context.Users.Add(newUser);
                await _context.SaveChangesAsync();

                return CreatedAtAction("GetUsers", new { id = newUser.userId }, newUser);
            }
            catch (Exception ex)
            {
                // Log the exception details for troubleshooting
                // You might want to use a logging framework (e.g., Serilog, NLog) in a production environment
                Console.Error.WriteLine($"Registration failed: {ex.Message}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Registration failed");
            }
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Users>>> GetUsers()
        {
            return await _context.Users.ToListAsync();
        }

        // Other actions...

        private string HashPassword(string password)
        {
            // Implement a secure password hashing algorithm (e.g., Argon2, BCrypt, or PBKDF2)
            // For simplicity, you can use a basic hashing algorithm for this example.
            return Convert.ToBase64String(Encoding.UTF8.GetBytes(password));
        }
    }
}
