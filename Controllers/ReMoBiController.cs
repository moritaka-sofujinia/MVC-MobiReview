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

        public ActionResult Details_Post()
        {
            return View();
        }
        public ActionResult New1() 
        {
            return View();
        }
        public ActionResult New2()
        {
            return View();
        }
        public ActionResult New3()
        {
            return View();
        }
        public ActionResult New4()
        {
            return View();
        }
        public ActionResult New5()
        {
            return View();
        }
        public ActionResult New6()
        {
            return View();
        }
        public ActionResult New7()
        {
            return View();
        }
        public ActionResult New8()
        {
            return View();
        }
        public ActionResult New9()
        {
            return View();
        }
        public ActionResult New10()
        {
            return View();
        }
        public ActionResult New11()
        {
            return View();
        }
    }
}