using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using TripAppBackend_.Models;

namespace TripAppBackend_
{
    public interface ILoginDBContext
    {
        DbSet<RegisterModel> Users { get; set; }
        DbSet<TripModel> Trips { get; set; }
        DbSet<ExpenseModel> Expenses { get; set; }
    }

    public class LoginDBContext : IdentityDbContext<RegisterModel>, ILoginDBContext
    {
        public DbSet<RegisterModel> Users { get; set; }
        public DbSet<TripModel> Trips { get; set; }
        public DbSet<ExpenseModel> Expenses { get; set; }

        public LoginDBContext(DbContextOptions<LoginDBContext> options)
            : base(options)
        {
        }
    }
}
