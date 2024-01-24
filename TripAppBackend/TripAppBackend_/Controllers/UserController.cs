using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TripAppBackend_;
using TripAppBackend_.Models;
using System.Threading.Tasks;

namespace TripApp.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly LoginDBContext _context;
        private readonly UserManager<RegisterModel> _userManager;
        private readonly SignInManager<RegisterModel> _signInManager;

        public UserController(LoginDBContext context, UserManager<RegisterModel> userManager, SignInManager<RegisterModel> signInManager)
        {
            _context = context;
            _userManager = userManager;
            _signInManager = signInManager;
        }

        [HttpPost("register")]
        public async Task<ActionResult<IActionResult>> Register([FromBody] RegisterModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid registration data");
            }

            var existingUser = await _context.Users.FirstOrDefaultAsync(u => u.UserName == model.UserName);

            if (existingUser != null)
            {
                return Conflict("Username already exists");
            }

            await _userManager.CreateAsync(model);
            await _context.SaveChangesAsync();

            return Ok("Registration successful");
        }
    }
}
