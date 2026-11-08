using Microsoft.AspNetCore.Authentication;
using BookStoreOnline.Data;
using BookStoreOnline.Models;
using BookStoreOnline.Services;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllersWithViews(o => o.Filters.Add(new AutoValidateAntiforgeryTokenAttribute()));
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<BookStoreContext>(o => o.UseSqlServer(builder.Configuration.GetConnectionString("BookStore")));
builder.Services.AddScoped<IPasswordHasher<User>, PasswordHasher<User>>();
builder.Services.AddScoped<CartService>();
builder.Services.AddScoped<ReadingListService>();
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(o => { o.Cookie.HttpOnly = true; o.Cookie.IsEssential = true; o.IdleTimeout = TimeSpan.FromHours(2); });
builder.Services.AddHttpContextAccessor();
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie(o => { o.LoginPath="/Account/Login"; o.AccessDeniedPath="/Home/Denied"; o.Cookie.HttpOnly=true; o.Cookie.SecurePolicy=builder.Environment.IsDevelopment()?CookieSecurePolicy.SameAsRequest:CookieSecurePolicy.Always; o.ExpireTimeSpan=TimeSpan.FromHours(8);
 o.Events.OnRedirectToLogin = context => {
  if (context.Request.Path.StartsWithSegments("/api")) { context.Response.StatusCode = StatusCodes.Status401Unauthorized; return Task.CompletedTask; }
  context.Response.Redirect(context.RedirectUri); return Task.CompletedTask;
 };
 o.Events.OnRedirectToAccessDenied = context => {
  if (context.Request.Path.StartsWithSegments("/api")) { context.Response.StatusCode = StatusCodes.Status403Forbidden; return Task.CompletedTask; }
  context.Response.Redirect(context.RedirectUri); return Task.CompletedTask;
 };
 o.Events.OnValidatePrincipal=async context=>{var db=context.HttpContext.RequestServices.GetRequiredService<BookStoreContext>();var idText=context.Principal?.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value;if(!int.TryParse(idText,out var id)){context.RejectPrincipal();return;}var u=await db.Users.AsNoTracking().FirstOrDefaultAsync(x=>x.Id==id);if(u==null||!u.IsActive||u.Role!=context.Principal?.FindFirst(System.Security.Claims.ClaimTypes.Role)?.Value){context.RejectPrincipal();await context.HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);}}; });
builder.Services.AddAuthorization();
var app = builder.Build();
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
if (!app.Environment.IsDevelopment()) { app.UseExceptionHandler("/Home/Error"); app.UseHsts(); }
app.UseHttpsRedirection(); app.UseStaticFiles(); app.UseRouting(); app.UseSession(); app.UseAuthentication(); app.UseAuthorization();
app.MapControllers();
app.MapControllerRoute("default", "{controller=Home}/{action=Index}/{id?}");
// Database First: execute Database/01_schema.sql, then 02_seed.sql. No EnsureCreated or migrations.
app.Run();
