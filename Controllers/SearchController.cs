using ReMoBi_DCSN.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReMoBi_DCSN.Controllers
{
    public class SearchController : Controller
    {
        private readonly dbDataContext dbdata;
        public SearchController()
        {
            var connectionString = "Data Source=MSIKHOI;Database=news1;Trusted_Connection=True";
            dbdata = new dbDataContext(connectionString);
        }
        // GET: Search
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Search(string strSearch)
        {
            ViewBag.Search = strSearch;
            if (string.IsNullOrEmpty(strSearch))
            {
                return View();
            }

            var kq = dbdata.Posts.Where(n => n.Post_Title.Contains(strSearch));
            ViewBag.Kq = kq.Count();
            return View(kq);
        }
    }
}