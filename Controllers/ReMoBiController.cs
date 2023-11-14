using ReMoBi_DCSN.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList.Mvc;
using System.Drawing.Printing;
using System.Web.UI;

namespace ReMoBi_DCSN.Controllers
{
    public class ReMoBiController : Controller
    {
        // GET: ReMoBi
        public static SQLiteHandler db = SQLiteHandler.Instance;

        private readonly dbDataContext dbdata;
        public ReMoBiController()
        {
            var connectionString = "Data Source=MSIKHOI;Database=news1;Trusted_Connection=True";
            dbdata = new dbDataContext(connectionString);
        }
        private List<Post> getNewPost(int count)
        {
            return dbdata.Posts.OrderByDescending(a => a.Post_Date).Take(count).ToList();
        }
        public ActionResult Index(int ?page, string tags)
        {
            int pageNum = (page ?? 1);
            int pageSize = 10;
            
            var query = dbdata.Posts.AsQueryable(); // Start with the complete list of books
            var newP = getNewPost(24);
            var newPost = query.OrderBy(n => n.Post_Date);
            ViewBag.MaxLike = dbdata.Posts.Max(n => n.luotthich);
            return View(newPost.ToPagedList(pageNum,pageSize));
        }

        public ActionResult Details_Post(int id)
        {
            var post = from s in dbdata.Posts
                       where s.PostID == id
                       select s;
            return View(post);
        }

        //public ActionResult Details_Post(int id)
        //{
        //    return View();
        //}

        private List<Post> getMostPostLike(int count)
        {
            return dbdata.Posts.OrderByDescending(a => a.luotthich).Take(count).ToList();
        }
        [ChildActionOnly]
        public ActionResult MostLike()
        {
            var post = getMostPostLike(1);
            return PartialView(post);
        }
        [ChildActionOnly]
        public ActionResult Tags_Partial()
        {
            var cd = from c in dbdata.tags select c;
            return PartialView(cd);
        }
    }
}