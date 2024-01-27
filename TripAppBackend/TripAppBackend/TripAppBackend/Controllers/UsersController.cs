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
                return NotFound();
            }

            return Ok(user);
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

                if (_context.Users.Any(u => u.UserName == newUser.UserName || u.Email == newUser.Email))
                {
                    return Conflict("User with the same username or email already exists");
                }

                newUser.Password = HashPassword(newUser.Password);

                _context.Users.Add(newUser);
                await _context.SaveChangesAsync();

                return CreatedAtAction("GetUsers", new { id = newUser.userId }, newUser);
            }
            catch (Exception ex)
            {
             
                Console.Error.WriteLine($"Registration failed: {ex.Message}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Registration failed");
            }
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Users>>> GetUsers()
        {
            return await _context.Users.ToListAsync();
        }


        private string HashPassword(string password)
        {
            
            return Convert.ToBase64String(Encoding.UTF8.GetBytes(password));
        }
    }
}
