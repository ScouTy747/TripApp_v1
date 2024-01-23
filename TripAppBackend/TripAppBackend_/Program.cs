using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;
using System.Text.Json.Serialization;
using TripAppBackend_.Models;
using Microsoft.Extensions.Configuration;
using TripAppBackend_;

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

builder.Services.AddControllers();


var app = builder.Build();

app.UseHttpsRedirection();

app.MapControllers();

app.Run();

public record Shirt(int Id, string? Title, DateOnly? DueBy = null, bool IsComplete = false);

[JsonSerializable(typeof(Shirt[]))]
internal partial class AppJsonSerializerContext : JsonSerializerContext
{

}