using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;
using System.Text.Json.Serialization;
using TripAppBackend_.Models;
using Microsoft.Extensions.Configuration;
using TripAppBackend_;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Identity;



var builder = WebApplication.CreateBuilder(args);

builder.Services.ConfigureHttpJsonOptions(options =>
{
    options.SerializerOptions.TypeInfoResolverChain.Insert(0, AppJsonSerializerContext.Default);

});

builder.Logging.ClearProviders();


builder.Services.AddDbContext<LoginDBContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("LoginDBconnection"));
});

builder.Services.AddIdentity<RegisterModel, IdentityRole>()
    .AddEntityFrameworkStores<LoginDBContext>()
    .AddDefaultTokenProviders();

builder.Services.AddControllers();

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

app.Run();


public record UserDetails(string Username, string Password, string Email);

[JsonSerializable(typeof(RegisterModel[]))]
[JsonSerializable(typeof(UserDetails[]))]
internal partial class AppJsonSerializerContext : JsonSerializerContext
{

}

