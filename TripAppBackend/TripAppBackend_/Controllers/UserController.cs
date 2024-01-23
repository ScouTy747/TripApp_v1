using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using TripAppBackend_;
using TripAppBackend_.Models;

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
        public async Task<IActionResult> Register([FromBody] RegisterModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var user = new RegisterModel
            {
                UserName = model.UserName,
                Email = model.Email,
            };

            var result = await _userManager.CreateAsync(user, model.Password);

            if (result.Succeeded)
            {
                await _signInManager.SignInAsync(user, isPersistent: false);

                return Ok("Registration successful");
            }
            else
            {
                return BadRequest(result.Errors);
            }
        }
    }
}
