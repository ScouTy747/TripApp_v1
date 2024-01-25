using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TripAppBackend_.Models;
using TripAppBackend_;

namespace TripApp.API.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class TripController : ControllerBase
    {
        private readonly LoginDBContext _context;
        private readonly UserManager<RegisterModel> _userManager;

        public TripController(LoginDBContext context, UserManager<RegisterModel> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        [HttpPost("create-trip")]
        public async Task<ActionResult<TripModel>> CreateTrip([FromBody] TripModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var user = await _userManager.GetUserAsync(HttpContext.User);

            if (user == null)
            {
                return NotFound("User not found");
            }

            model.UserId = user.Id;

            await _context.Trips.AddAsync(model);
            await _context.SaveChangesAsync();

            return Ok(model);
        }

        [HttpGet("get-trips")]
        public async Task<ActionResult<IEnumerable<TripModel>>> GetTrips()
        {
            var user = await _userManager.GetUserAsync(HttpContext.User);

            if (user == null)
            {
                return NotFound("User not found");
            }

            var trips = await _context.Trips.Where(t => t.UserId == user.Id).ToListAsync();

            return Ok(trips);
        }

        [HttpPost("{tripId}/add-expense")]
        public async Task<ActionResult<ExpenseModel>> AddExpense(int tripId, [FromBody] ExpenseModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var trip = await _context.Trips.FindAsync(tripId);

            if (trip == null)
            {
                return NotFound("Trip not found");
            }

            model.UserId = trip.UserId;

            await _context.Expenses.AddAsync(model);
            await _context.SaveChangesAsync();

            return Ok(model);
        }

        [HttpGet("{tripId}/get-expenses")]
        public async Task<ActionResult<IEnumerable<ExpenseModel>>> GetExpensesByTripId(int tripId)
        {
            var trip = await _context.Trips.FindAsync(tripId);

            if (trip == null)
            {
                return NotFound("Trip not found");
            }

            var expenses = await _context.Expenses.Where(e => e.TripId == tripId).ToListAsync();

            return Ok(expenses);
        }

        [HttpPut("update-expense/{expenseId}")]
        public async Task<ActionResult<ExpenseModel>> UpdateExpense(int expenseId, [FromBody] ExpenseModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var expense = await _context.Expenses.FindAsync(expenseId);

            if (expense == null)
            {
                return NotFound("Expense not found");
            }

            expense.Amount = model.Amount;
            expense.Date = model.Date;
            expense.Description = model.Description;

            await _context.SaveChangesAsync();

            return Ok(expense);
        }

    }
}
