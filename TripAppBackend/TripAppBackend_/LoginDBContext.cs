using Microsoft.EntityFrameworkCore;
using TripAppBackend_.Models;

namespace TripAppBackend_
{
    public class LoginDBContext : DbContext
    {
        public LoginDBContext(DbContextOptions<LoginDBContext> options) : base(options)
        {
        }
        public DbSet<RegisterModel> Users { get; set; }
    }
}
