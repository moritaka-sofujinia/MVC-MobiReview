using ReMoBi_DCSN.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReMoBi_DCSN.Controllers
{
    public class ReMoBiController : Controller
    {
        // GET: ReMoBi
        public static SQLiteHandler db = SQLiteHandler.Instance;

        private readonly dbDataContext dbdata;
        public ReMoBiController()
        {
            var connectionString = "Data Source=Albert;Database=news1;Trusted_Connection=True";
            dbdata = new dbDataContext(connectionString);
        }
        public ActionResult Index()
        {
            
            return View();
        }
    }
}