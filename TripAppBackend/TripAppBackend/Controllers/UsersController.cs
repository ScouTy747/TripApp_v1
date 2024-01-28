// Inside UsersController.cs

using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using NuGet.Protocol.Plugins;
using TripAppBackend.Models;
using TripAppBackend.Services;

namespace TripAppBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly ApiDbContext _context;
        private readonly TokenService _tokenService;

        public UsersController(ApiDbContext context, TokenService tokenService)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
            _tokenService = tokenService ?? throw new ArgumentNullException(nameof(tokenService));
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Users>> GetUserById(int id)
        {
            var user = await _context.Users
                .Where(u => u.userId == id)
                .FirstOrDefaultAsync();

            if (user == null)
            {
                return NotFound();
            }

            var userDto = new Users
            {
                userId = user.userId,
                UserName = user.UserName,
                Email = user.Email
            };

            return Ok(userDto);
        }

        [HttpGet("LoggedInUser")]
        public async Task<ActionResult<Users>> GetLoggedInUser()
        {
            if (!Request.Headers.ContainsKey("Authorization"))
            {
                return Unauthorized("Missing Authorization header");
            }

            var token = HttpContext.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

            if (string.IsNullOrEmpty(token))
            {
                return Unauthorized("Missing or invalid token");
            }

            try
            {
                var userId = _tokenService.GetUserIdFromToken(token);

                if (userId == -1)
                {
                    return Unauthorized("Invalid token");
                }

                var user = await _context.Users.FirstOrDefaultAsync(u => u.userId == userId);

                if (user == null)
                {
                    return NotFound();
                }

                var userDto = new Users
                {
                    userId = user.userId,
                    UserName = user.UserName,
                    Email = user.Email
                };

                return Ok(userDto);
            }
            catch (Exception ex)
            {
                return Unauthorized("Invalid token");
            }
        }


        [HttpPost("login")]
        public async Task<ActionResult<LoginResponse>> Login(Login credentials)
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

            var token = _tokenService.GenerateToken(user.userId);

            return Ok(new LoginResponse
            {
                UserId = user.userId,
                UserName = user.UserName,
                Email = user.Email,
                Token = token
            });
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

                return CreatedAtAction(nameof(GetUserById), new { id = newUser.userId }, newUser);
            }
            catch (Exception ex)
            {
             
                Console.Error.WriteLine($"Registration failed: {ex.Message}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Registration failed");
            }
        }

        private string HashPassword(string password)
        {
            
            return Convert.ToBase64String(Encoding.UTF8.GetBytes(password));
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var user = await _context.Users.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            _context.Users.Remove(user);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
