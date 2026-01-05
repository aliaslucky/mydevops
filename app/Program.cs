var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

// Semplice endpoint
app.MapGet("/hello", () => "Hello from GitHub Actions Devops!");

app.Run();