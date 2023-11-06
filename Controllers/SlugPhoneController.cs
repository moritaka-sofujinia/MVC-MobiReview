using PagedList;
using ReMoBi_DCSN.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

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
        private List<Post> getNewPost(int count)
        {
            return dbdata.Posts.OrderByDescending(a => a.Post_Tags <= 5).Take(count).ToList();
        }
        // GET: Slug_Phone_
        public ActionResult Index(int ?page, string tags)
        {
            int pageNum = (page ?? 1);
            int pageSize = 10;

            var query = dbdata.Posts.AsQueryable(); // Start with the complete list of books
            var newP = getNewPost(24);
            //var newPost = query.OrderBy(n => n.Post_Tags);
            return View(newP.ToPagedList(pageNum, pageSize));
           
        }

        public ActionResult Details_Post(int id)
        {
            var post = from s in dbdata.Posts
                       where s.PostID == id
                       select s;
            return View(post.Single());
        }
    }
}