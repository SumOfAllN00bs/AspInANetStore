using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace AspInANetStoreFrontEnd
{
    public class StaffAuthorizeAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (httpContext == null)
                throw new ArgumentNullException("httpContext");
            bool authorized = base.AuthorizeCore(httpContext);
            var myvar = httpContext.Session["UserId"];
            if (myvar == null)
                authorized = false;
            else
            {
                Models.AspInANetStoreDatabaseEntities1 db = new Models.AspInANetStoreDatabaseEntities1();
                int myvarId = Convert.ToInt32(myvar);
                if (db.Staffs.Where(s => s.AccountId == myvarId).FirstOrDefault() != null)
                    authorized = true;
            }
            /*This file is a hack. base.AuthorizeCore(httpContext) is always saying the user is not authenticated
             I haven't been able to diagnose why so instead of first checking if user is authenticated before checking if
             user is authorized I have just skipped to the point where the user is authorized as long as they are staff*/
            return authorized;
        }
    }
}