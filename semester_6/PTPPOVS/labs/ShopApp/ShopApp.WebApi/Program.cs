using ShopApp.Core.Data;
using ShopApp.Core.Models;
using ShopApp.Core.Services;
using ShopApp.WebApi.Data;
using ShopApp.WebApi.Services;

WebApplicationBuilder builder = WebApplication.CreateBuilder(args);

string connectionString = builder.Configuration.GetConnectionString("DefaultConnection")
    ?? "Data Source=shopapp.db";

builder.Services.AddSingleton<IDataBase>(new SqliteDataBase(connectionString));
builder.Services.AddSingleton<IProductsService<Product>, ProductsService>();
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    string basePath = AppContext.BaseDirectory;
    string xmlPath = Path.Combine(basePath, "ShopApp.WebApi.xml");
    options.IncludeXmlComments(xmlPath);
});

WebApplication app = builder.Build();

// Configure the HTTP request pipeline.
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
