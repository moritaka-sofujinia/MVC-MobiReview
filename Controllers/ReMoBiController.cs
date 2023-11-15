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
            var connectionString = "Data Source=Albert;Database=news1;Trusted_Connection=True";
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

            var post = dbdata.Posts.FirstOrDefault(p => p.PostID == id);

            if (post == null)
            {
                return HttpNotFound(); // Xử lý nếu không tìm thấy bài viết
            }

            var images = (from pi in dbdata.PostImages
                          join i in dbdata.images on pi.ImageID equals i.imagesID
                          where pi.PostID == id
                          select i).ToList();

            var viewModel = new PostImageViewModel
            {
                Post = post,
                Images = images
            };
            
            return View(viewModel);
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
        public ActionResult Tags_Partial(int? page, string tags)
        {
            var cd = from c in dbdata.tags select c;
            return PartialView(cd);
        }
        public ActionResult PostbyTags(int ?page, int id)
        {
            int pageNum = (page ?? 1);
            int pageSize = 10;

            var pbt = dbdata.Posts.Where(n => n.TagID == id).OrderBy(s => s.Post_Title).ToPagedList(pageNum, pageSize);
            return PartialView(pbt);
        }
        [HttpGet]
        public ActionResult Search(string strSearch)
        {
            // Lưu từ khóa tìm kiếm
            ViewBag.Keyword = strSearch;

            // Tạo câu truy vấn 3 bảng Sach, TacGia, ChuDe
            //var sach = db.SACHes.Include(b => b.Sach);
            // Tìm kiếm theo strSearch
            if (strSearch != null)
            {
                var Model = dbdata.Posts.Where(e => e.Post_Title.Contains(strSearch));
                return View(Model);
            }

            // Tìm kiếm theo chủ đềs
            return PartialView(null);
        }
    }
}