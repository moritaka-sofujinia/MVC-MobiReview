using ReMoBi_DCSN.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReMoBi_DCSN.Controllers
{
    public class SlugPhoneController : Controller
    {
        public static SQLiteHandler db = SQLiteHandler.Instance;

        private readonly dbDataContext dbdata;
        public SlugPhoneController()
        {
            var connectionString = "Data Source=Albert;Database=news1;Trusted_Connection=True";
            dbdata = new dbDataContext(connectionString);
        }
        // GET: Slug_Phone_
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult New13()
        {
            return View();
        }
        public ActionResult New11()
        {
            return View();
        }
        public ActionResult New14()
        {
            return View();
        }
    }
}