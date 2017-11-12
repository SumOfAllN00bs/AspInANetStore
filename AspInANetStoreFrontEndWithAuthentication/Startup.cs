using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AspInANetStoreFrontEndWithAuthentication.Startup))]
namespace AspInANetStoreFrontEndWithAuthentication
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
