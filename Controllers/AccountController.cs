using System.Security.Claims;
using BookStoreOnline.Data;
using BookStoreOnline.Models;
using BookStoreOnline.ViewModels;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
namespace BookStoreOnline.Controllers;
public class AccountController(BookStoreContext db,IPasswordHasher<User> hasher):Controller {
 [HttpGet] public IActionResult Login(string? returnUrl=null){ViewBag.ReturnUrl=returnUrl;return View(new LoginForm());}
 [HttpPost] public async Task<IActionResult> Login(LoginForm f,string? returnUrl=null){ViewBag.ReturnUrl=returnUrl;if(!ModelState.IsValid)return View(f);var email=f.Email.Trim().ToLowerInvariant();var u=await db.Users.SingleOrDefaultAsync(x=>x.Email==email);if(u==null||!u.IsActive||hasher.VerifyHashedPassword(u,u.PasswordHash,f.Password)==PasswordVerificationResult.Failed){ModelState.AddModelError("","Email hoặc mật khẩu không đúng, hoặc tài khoản bị khóa.");return View(f);}await SignIn(u);return Url.IsLocalUrl(returnUrl)?LocalRedirect(returnUrl!):RedirectToAction("Index","Home");}
 [HttpGet] public IActionResult Register(string? returnUrl=null){ViewBag.ReturnUrl=returnUrl;return View(new RegisterForm());}
 [HttpPost] public async Task<IActionResult> Register(RegisterForm f,string? returnUrl=null){ViewBag.ReturnUrl=returnUrl;if(!ModelState.IsValid)return View(f);var email=f.Email.Trim().ToLowerInvariant();if(await db.Users.AnyAsync(x=>x.Email==email)){ModelState.AddModelError("Email","Email đã được sử dụng.");return View(f);}var u=new User{FullName=f.FullName.Trim(),Email=email};u.PasswordHash=hasher.HashPassword(u,f.NewPassword);db.Users.Add(u);try{await db.SaveChangesAsync();}catch(DbUpdateException){ModelState.AddModelError("","Không thể tạo tài khoản. Vui lòng thử email khác.");return View(f);}await SignIn(u);return Url.IsLocalUrl(returnUrl)?LocalRedirect(returnUrl!):RedirectToAction("Index","Home");}
 private Task SignIn(User u)=>HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme,new ClaimsPrincipal(new ClaimsIdentity(new[]{new Claim(ClaimTypes.NameIdentifier,u.Id.ToString()),new Claim(ClaimTypes.Name,u.FullName),new Claim(ClaimTypes.Role,u.Role)},CookieAuthenticationDefaults.AuthenticationScheme)));
 [HttpPost,Authorize] public async Task<IActionResult> Logout(){await HttpContext.SignOutAsync();HttpContext.Session.Clear();return RedirectToAction("Index","Home");}
}
