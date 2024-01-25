using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using TripAppBackend_;
using TripAppBackend_.Models;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<LoginDBContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("LoginDBconnection"));
});

builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();

builder.Services.AddIdentity<RegisterModel, IdentityRole>()
    .AddEntityFrameworkStores<LoginDBContext>()
    .AddDefaultTokenProviders();

var app = builder.Build();

using (var scope = app.Services.CreateScope())
{
    var dbContext = scope.ServiceProvider.GetRequiredService<LoginDBContext>();
    var userManager = scope.ServiceProvider.GetRequiredService<UserManager<RegisterModel>>();
    var signInManager = scope.ServiceProvider.GetRequiredService<SignInManager<RegisterModel>>();
}

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();
app.MapRazorPages();

app.Run();
