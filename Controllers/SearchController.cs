using PagedList;
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
        
        public ActionResult Search(int ?page, string strSearch)
        {
            int pageNum = (page ?? 1);
            int pageSize = 10;

            ViewBag.Search = strSearch;
            var query = dbdata.Posts.AsQueryable();

            if (!string.IsNullOrEmpty(strSearch))
            {
                // Filter by publisher name
                query = query.Where(b => b.Post_Title.Contains(strSearch));
            }

            var kq = dbdata.Posts.Where(n => n.Content_Post.Contains(strSearch));
            ViewBag.Kq = kq.Count();
            return View(query.OrderBy(n => n.Post_Date).ToPagedList(pageNum, pageSize));
        }
    }
}