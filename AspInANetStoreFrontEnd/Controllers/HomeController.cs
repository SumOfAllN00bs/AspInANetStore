using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Principal;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace AspInANetStoreFrontEnd.Controllers
{
    public class HomeController : Controller
    {
        //static int saltLengthLimit = 32;
        public ActionResult Index() => View();

        public ActionResult Login() => View();

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string Username, string Password)
        {
            if (ModelState.IsValid)
            {
                using(Models.AspInANetStoreDatabaseEntities1 db = new Models.AspInANetStoreDatabaseEntities1())
                {
                    var obj = db.Accounts.Where(a => a.Username.Trim() == Username.Trim()).FirstOrDefault();
                    if (obj != null)
                    {
                        var PasswordHash = obj.PasswordHash;
                        var Salt = obj.Salt;

                        if(ComparePasswordHash(Password, Username, PasswordHash, Salt))
                        {
                            FormsAuthentication.SignOut();
                            FormsAuthentication.SetAuthCookie(Username, false);
                            Session["UserID"] = obj.Id;
                            return RedirectToAction("Index");
                        }
                        else
                        {
                            ViewBag.Message = "Error #01: Access Denied! Wrong Credentials";
                            return View();
                        }
                    }
                    else
                    {
                        ViewBag.Message = "Error #02: Access Denied! Wrong Credentials";
                        return View();
                    }
                }
            }
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Logout()
        {
            try
            {
                FormsAuthentication.SignOut();
                HttpContext.User = new GenericPrincipal(new GenericIdentity(string.Empty), null);
                Session.Clear();
                System.Web.HttpContext.Current.Session.RemoveAll();
                return RedirectToAction("Index", "Home");
            }
            catch
            {
                throw;
            }
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        private static byte[] SaltMe(int maximumSaltLength)
        {
            var salt = new byte[maximumSaltLength];
            using (var random = new RNGCryptoServiceProvider())
            {
                random.GetNonZeroBytes(salt);
            }
            return salt;
        }

        public static string SHA512_Hash(string password, string username, byte[] salt)
        {
            try
            {
                byte[] plainTextBytes = Encoding.UTF8.GetBytes(password + username);
                byte[] plainTextWithSaltBytes = new byte[plainTextBytes.Length + salt.Length];

                for (int i = 0; i < plainTextBytes.Length; i++) plainTextWithSaltBytes[i] = plainTextBytes[i];
                for (int i = 0; i < salt.Length; i++) plainTextWithSaltBytes[plainTextBytes.Length + i] = salt[i];

                HashAlgorithm hash = new SHA512Managed();
                byte[] hashBytes = hash.ComputeHash(plainTextWithSaltBytes);
                byte[] hashWithSaltBytes = new byte[hashBytes.Length + salt.Length];

                for (int i = 0; i < hashBytes.Length; i++) hashWithSaltBytes[i] = hashBytes[i];
                for (int i = 0; i < salt.Length; i++) hashWithSaltBytes[hashBytes.Length + i] = salt[i];

                return Convert.ToBase64String(hashWithSaltBytes);
            }
            catch
            {
                return string.Empty;
            }
        }

        public static bool ComparePasswordHash(string password, string username, string OldHASHValue, byte[] SALT)
        {
            try
            {
                string expectedHashString = SHA512_Hash(password, username, SALT);
                return (OldHASHValue == expectedHashString);
            }
            catch
            {
                return false;
            }
        }
    }
}