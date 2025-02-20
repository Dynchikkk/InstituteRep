using Microsoft.AspNetCore.Mvc;

namespace ShopApp.Controllers
{
    /// <summary>
    /// Home controller for ShopApp
    /// </summary>
    public class HomeController : ControllerBase
    {
        /// <summary>
        /// Home page for ShopApp
        /// </summary>
        /// <returns>Home string</returns>
        public string Index()
        {
            return "Made by D. Belyaev and M. Demin";
        }
    }
}
