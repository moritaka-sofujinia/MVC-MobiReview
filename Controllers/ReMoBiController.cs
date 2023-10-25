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
        
        public ActionResult Index()
        {
            db.OpenConnection();
            return View();
        }
    }
}