using Microsoft.EntityFrameworkCore;
using ShopApp.Core.Models;
using ShopApp.Core.Services;
using ShopApp.WebApi.Data;
using ShopApp.WebApi.Services;

WebApplicationBuilder builder = WebApplication.CreateBuilder(args);

// Retrieve connection string from configuration.
string connectionString = builder.Configuration.GetConnectionString("DefaultConnection") ?? "Data Source=shopapp.db";

// Register the application's DbContext using SQLite.
builder.Services.AddDbContext<ApplicationContext>(options => options.UseSqlite(connectionString));
// Register the product service for dependency injection.
builder.Services.AddScoped<IProductsService<Product>, DataBaseProductService>();

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    string basePath = AppContext.BaseDirectory;
    string xmlPath = Path.Combine(basePath, "ShopApp.WebApi.xml");
    options.IncludeXmlComments(xmlPath);
});

WebApplication app = builder.Build();

using (IServiceScope scope = app.Services.CreateScope())
{
    ApplicationContext context = scope.ServiceProvider.GetRequiredService<ApplicationContext>();
    context.Database.Migrate();
}

if (app.Environment.IsDevelopment())
{
    _ = app.UseSwagger();
    _ = app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthorization();

app.MapControllers();
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}");

app.Run();
