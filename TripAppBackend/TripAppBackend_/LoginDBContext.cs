using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using TripAppBackend_.Models;

namespace TripAppBackend_
{
    public class LoginDBContext : IdentityDbContext<RegisterModel>
    {
        public LoginDBContext(DbContextOptions<LoginDBContext> options)
            : base(options)
        {
        }

        public DbSet<RegisterModel> Users { get; set; }
    }
}
