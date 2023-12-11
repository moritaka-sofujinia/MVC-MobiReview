using PagedList;
using ReMoBi_DCSN.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ReMoBi_DCSN.Controllers
{
    public class AdminController : Controller
    {
        private readonly dbDataContext dbdata;
        public AdminController()
        {
            var connectionString = "Data Source=Albert;Database=news1;Trusted_Connection=True";
            dbdata = new dbDataContext(connectionString);
        }
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var tendn = collection["TenDN"];
            var matkhau = collection["MatKhau"];
            if (string.IsNullOrEmpty(tendn))
            {
                ViewData["Error1"] = "Vui long dien day du ten dang nhap";
            }
            else if (string.IsNullOrEmpty(matkhau))
            {
                ViewData["Error2"] = "Vui long dien day du mat khau";
            }
            else
            {
                KhachHang kh = dbdata.KhachHangs.SingleOrDefault(n => n.username == tendn && n.password == matkhau);
                ADMIN ad = dbdata.ADMINs.SingleOrDefault(n => n.username == tendn && n.password == matkhau);
                if (ad != null)
                {
                    ViewBag.ThongBao = "Da dang nhap thanh cong";
                    Session["Admin"] = ad;
                    //Session["ResetToken"] = Guid.NewGuid().ToString(); // Tạo và lưu token mới
                    return RedirectToAction("Index", "Admin"); // Chuyển đến trang Index của Admin
                }
                else if (kh != null)
                {
                    ViewBag.ThongBao = "Da dang nhap thanh cong";
                    Session["TaiKhoan"] = kh;
                    return RedirectToAction("Index", "ReMoBi"); // Chuyển đến trang Index của BookStore
                }
                else
                {
                    ViewBag.ThongBao = "Ten dang nhap hoac mat khau khong dung !";
                }


            }
            return View();
        }


        public ActionResult Logout()
        {
            Session["Admin"] = null;//remove session
            return RedirectToAction("Login", "Admin");
        }




        //get: Post 
        public ActionResult Post(int ? page, string tags, string title)
        {
            int pageNum = (page ?? 1);
            int pageSize = 5;

            var query = dbdata.Posts.AsQueryable();

            if (!string.IsNullOrEmpty(tags))
            {
                // Filter by publisher name
                query = query.Where(b => b.tag.Name_Tags.Contains(tags));
            }

            if (!string.IsNullOrEmpty(title))
            {
                // Filter by book name
                query = query.Where(b => b.Post_Title.Contains(title));
            }
            
            //return View(db.SACHes.ToList().OrderBy(n => n.MaSach).ToPagedList(pagenumber,pageSize));
            return View(query.OrderBy(n => n.Post_Date).ToPagedList(pageNum,pageSize));
        }

        //[Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult AddnewPost() 
        {
            ViewBag.TagID = new SelectList(dbdata.tags.ToList().OrderBy(n => n.TagID), "TagID", "Name_Tags");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddnewPost(Post post, HttpPostedFileBase fileupload)
        {
            ViewBag.TagID = new SelectList(dbdata.tags.ToList().OrderBy(n => n.TagID), "TagID", "Name_Tags");
            if (fileupload == null)
            {
                ViewBag.thongbao = "Vui long chon anh bia cho bai viet";
                
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var filename = Path.GetFileName(fileupload.FileName);
                    var path = Path.Combine(Server.MapPath("~/images/"), filename);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.ThongBao = "Hinh anh da ton tai !";
                    }
                    else
                    {
                        fileupload.SaveAs(path);
                    }
                    post.AnhBia = filename;
                    dbdata.Posts.InsertOnSubmit(post);
                    dbdata.SubmitChanges();
                }
            }
            
            return RedirectToAction("Post");
        }

        //[Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult DeletePost(int id)
        {
            Post post = dbdata.Posts.SingleOrDefault(n => n.PostID == id);
            ViewBag.PostID = post.PostID;
            if (post == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(post);
        }
        [HttpPost, ActionName("DeletePost")]
        [ValidateAntiForgeryToken]
        public ActionResult ConfirmDeletePost(int id)
        {
            Post post = dbdata.Posts.SingleOrDefault(n => n.PostID == id);
            ViewBag.PostID = post.PostID;
            if (post == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            dbdata.Posts.DeleteOnSubmit(post);
            dbdata.SubmitChanges();
            return RedirectToAction("Post");
        }


        public Post GetthePost(int id)
        {
            return dbdata.Posts.Where(p => p.PostID == id).SingleOrDefault();
        }

        [HttpGet]
        public ActionResult EditPost(int id)
        {
            Post post = dbdata.Posts.SingleOrDefault(n => n.PostID == id);

            if (post == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            ViewBag.TagID = new SelectList(dbdata.tags.ToList().OrderBy(n => n.Name_Tags), "TagID", "Name_Tags", post.TagID);
            return View(post);
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult EditPost([Bind(Include = "PostID,Post_Title,Author,Post_Date,Teaser_Post,Content_Post,TagID,AnhBia,luotthich")] Post post, 
            HttpPostedFileBase fileupload)
        {
            ViewBag.TagID = new SelectList(dbdata.tags.ToList().OrderBy(n => n.Name_Tags), "TagID", "Name_Tags");


            if (fileupload == null)
            {
                ViewBag.ThongBao = "Vui long chon Anh Bia !";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var filename = Path.GetFileName(fileupload.FileName);
                    var path = Path.Combine(Server.MapPath("~/images/"), filename);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.ThongBao = "Hinh anh da ton tai !";

                    }
                    else
                    {
                        fileupload.SaveAs(path);
                    }

                    post.AnhBia = filename;
                    UpdateModel(post);
                    dbdata.SubmitChanges();
                }
                return RedirectToAction("Post");
            }
        }

        public ActionResult Picture(int? page, string name)
        {
            int pageNum = (page ?? 1);
            int pageSize = 10;

            var query = dbdata.images.AsQueryable();

            if (!string.IsNullOrEmpty(name))
            {
                // Filter by publisher name
                query = query.Where(b => b.Name_file_images.Contains(name));
            }

            return View(query.OrderBy(n => n.imagesID).ToPagedList(pageNum, pageSize));
        }

        [HttpGet]
        public ActionResult AddnewPic()
        {
            ViewBag.PostID = new SelectList(dbdata.Posts.ToList().OrderBy(n => n.PostID), "PostID", "PostID");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddnewPic(image ima, HttpPostedFileBase fileupload)
        {
            ViewBag.PostID = new SelectList(dbdata.Posts.ToList().OrderBy(n => n.PostID), "PostID", "PostID");
            if (fileupload == null)
            {
                ViewBag.thongbao = "Vui long chon anh bia cho bai viet";

                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var filename = Path.GetFileName(fileupload.FileName);
                    var path = Path.Combine(Server.MapPath("~/images/"), filename);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.ThongBao = "Hinh anh da ton tai !";
                    }
                    else
                    {
                        fileupload.SaveAs(path);
                    }
                    ima.Name_file_images = filename;
                    dbdata.images.InsertOnSubmit(ima);
                    dbdata.SubmitChanges();
                }
            }

            return RedirectToAction("Picture");
        }



        public image GetthePic(int id)
        {
            return dbdata.images .Where(p => p.imagesID == id).SingleOrDefault();
        }

        [HttpGet]
        public ActionResult EditPic(int id)
        {
            image ima = dbdata.images.SingleOrDefault(n => n.imagesID == id);

            if (ima == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            ViewBag.PostID = new SelectList(dbdata.Posts.ToList().OrderBy(n => n.PostID), "PostID", "PostID", ima.PostID);
            return View(ima);
        }

        [HttpPost]
        [ValidateInput(false)]
       
        public ActionResult EditPic( 
            HttpPostedFileBase fileupload)
        {
            
            if (fileupload == null)
            {
                ViewBag.ThongBao = "Vui long chon Anh Bia !";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                 
                    var ima = GetthePic(int.Parse(Request.Form["imagesID"]));
                    ima.Name_file_images = Request.Form["Name_file_images"];
                    ima.Caption_images = Request.Form["Caption_images"];
                    ima.PostID = (int.Parse(Request.Form["PostID"]));
                    
                    dbdata.SubmitChanges();
                    return RedirectToAction("Picture");
                }
                return RedirectToAction("Picture");
            }
        }

        [HttpGet]
        public ActionResult DeletePic(int id)
        {
            image ima = dbdata.images.SingleOrDefault(n => n.imagesID == id);
            ViewBag.imagesID = ima.imagesID;
            if (ima == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(ima);
        }
        [HttpPost, ActionName("DeletePic")]
        public ActionResult ConfirmDeletePic(int id)
        {
            image ima = dbdata.images.SingleOrDefault(n => n.imagesID == id);
            ViewBag.imagesID = ima.imagesID;
            if (ima == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            dbdata.images.DeleteOnSubmit(ima);
            dbdata.SubmitChanges();
            return RedirectToAction("Picture");
        }


        //Get:  PostImages
        [HttpGet]
        public ActionResult PostImages(int ?page)
        {
            int pageNum = (page ?? 1);
            int pageSize = 10;

            var query = dbdata.PostImages.AsQueryable();
            return View(query.OrderBy(n => n.PostID).ToPagedList(pageNum, pageSize));
        }

        

        [HttpGet]
        public ActionResult AddnewPostImages()
        {
            ViewBag.PostID = new SelectList(dbdata.Posts.ToList().OrderBy(n => n.PostID), "PostID", "PostID");
            ViewBag.ImagesID = new SelectList(dbdata.images.ToList().OrderBy(n => n.imagesID), "imagesID", "imagesID");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddnewPostImages(PostImage Pima, HttpPostedFileBase fileupload)
        {
            ViewBag.PostID = new SelectList(dbdata.Posts.ToList().OrderBy(n => n.PostID), "PostID", "PostID");
            ViewBag.ImagesID = new SelectList(dbdata.images.ToList().OrderBy(n => n.imagesID), "imagesID", "imagesID");
            if (ModelState.IsValid)
            {
                dbdata.PostImages.InsertOnSubmit(Pima);
                dbdata.SubmitChanges();
            }
            return RedirectToAction("PostImages");
        }

        [HttpGet]
        public ActionResult DeletePostImages(int id)
        {
            PostImage pima = dbdata.PostImages.FirstOrDefault(n => n.PostID == id);
            ViewBag.PostID = pima.PostID;
            if (pima == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(pima);
        }
        [HttpPost, ActionName("DeletePostImages")]
        public ActionResult ConfirmDeletePostImages(int id)
        {
            PostImage pima = dbdata.PostImages.FirstOrDefault(n => n.PostID == id);
            ViewBag.PostID = pima.PostID;
            if (pima == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            dbdata.PostImages.DeleteOnSubmit(pima);
            dbdata.SubmitChanges();
            return RedirectToAction("PostImages");
        }

        


        //ADMIN_profile
        public ActionResult ProFile(string mkh)
        {
            var ttcn = from c in dbdata.ADMINs where c.hovaten == mkh select c;
            return View(ttcn);
        }

        //ADMIN_EDIT_PROFILES
        [HttpGet]
        public ActionResult EditProFile(int id)
        {
            ADMIN ad = dbdata.ADMINs.Where(n => n.AdminID == id).FirstOrDefault();
            return View(ad);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditProFile(ADMIN ad, FormCollection form)
        {
            var username = form["username"];
            var password = form["password"];
            var hovaten = form["hovaten"];

            if(ModelState.IsValid)
            {
                ad.hovaten = hovaten;
                ad.username = username;
                ad.password = password;
                UpdateModel(ad);
                dbdata.SubmitChanges();
                return RedirectToAction("ProFile");
            }
            else
            {
                return RedirectToAction("EdiProFile");
            }
            
        }


        //get : User
        public ActionResult TheUser(int? page, string Name, string Role)
        {
            int pageNum = (page ?? 1);
            int pageSize = 10;

            var query = dbdata.NguoiDungs.AsQueryable();

            if (!string.IsNullOrEmpty(Name))
            {
                // Filter by User name
                query = query.Where(b => b.hovaten.Contains(Name));
            }

            if (!string.IsNullOrEmpty(Role))
            {
                // Filter by book name
                query = query.Where(b => b.vaitro.Contains(Role));
            }

            //return View(db.SACHes.ToList().OrderBy(n => n.MaSach).ToPagedList(pagenumber,pageSize));
            return View(query.OrderBy(n => n.UserID).ToPagedList(pageNum, pageSize));
        }

        [HttpGet]
        public ActionResult AddnewUser()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddnewUser(NguoiDung user)
        {
            if(ModelState.IsValid)
            {

                dbdata.NguoiDungs.InsertOnSubmit(user);
                dbdata.SubmitChanges();
                return RedirectToAction("TheUser");
            }
            else
            {
                return View(user);
            }
            
        }
        [HttpGet]
        public ActionResult DeleteUser(int id)
        {
            NguoiDung User = dbdata.NguoiDungs.SingleOrDefault(n => n.UserID == id);
            ViewBag.UserID = User.UserID;
            if (User == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(User);
        }

        [HttpPost, ActionName("DeleteUser")]
        public ActionResult ConfirmDeleteUser(int id)
        {
            NguoiDung User = dbdata.NguoiDungs.SingleOrDefault(n => n.UserID == id);
            ViewBag.UserID = User.UserID;
            if (User == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            dbdata.NguoiDungs.DeleteOnSubmit(User);
            dbdata.SubmitChanges();
            return RedirectToAction("TheUser");
        }
        public NguoiDung GetUser(int id)
        {
            return dbdata.NguoiDungs.Where(n =>n.UserID == id).SingleOrDefault();
        }
        public KhachHang GetKhachHang(int id)
        {
            return dbdata.KhachHangs.Where(n => n.KhID == id).SingleOrDefault();
        }

        [HttpGet]
        public ActionResult EditUser(int id)
        {
            
            NguoiDung user = dbdata.NguoiDungs.SingleOrDefault(n => n.UserID == id);
            if (user == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            ViewBag.Role = new SelectList(dbdata.NguoiDungs.ToList().OrderBy(n => n.vaitro), "vaitro", "vaitro", user.vaitro);
            return View(user);
        }

        [HttpPost]
        [ValidateInput(false)]
        
        public ActionResult EditUser()
        {
            

            if (ModelState.IsValid)

            {
                // Dùng đối tượng Request.Form[""] để lấy giá trị của đối tượng truyền từ Form
                var user = GetUser(int.Parse(Request.Form["UserID"]));
                user.vaitro = Request.Form["vaitro"];
                user.hovaten = Request.Form["hovaten"];
                
                dbdata.SubmitChanges();
                return RedirectToAction("TheUser");

                //UpdateModel(user);
                //dbdata.SubmitChanges();
            }
            return RedirectToAction("TheUser");  
        }


        public ActionResult TheCustomer(int? page, string Name)
        {
            int pageNum = (page ?? 1);
            int pageSize = 5;

            var query = dbdata.KhachHangs.AsQueryable();

            if (!string.IsNullOrEmpty(Name))
            {
                // Filter by User name
                query = query.Where(b => b.hovaten.Contains(Name));
            }
            //return View(db.SACHes.ToList().OrderBy(n => n.MaSach).ToPagedList(pagenumber,pageSize));
            return View(query.OrderBy(n => n.KhID).ToPagedList(pageNum, pageSize));
        }
        [HttpGet]
        public ActionResult EditCustomer(int id)
        {
            KhachHang kh = dbdata.KhachHangs.SingleOrDefault(n => n.KhID == id);
            if (kh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(kh);
        }

        [HttpPost]
        public ActionResult EditCustomer()
        {
            if (ModelState.IsValid)
            {
                // Dùng đối tượng Request.Form[""] để lấy giá trị của đối tượng truyền từ Form
                var kh = GetKhachHang(int.Parse(Request.Form["KhID"]));
                kh.hovaten = Request.Form["hovaten"];
                kh.username = Request.Form["username"];
                kh.password = Request.Form["password"];

                dbdata.SubmitChanges();
                return RedirectToAction("TheCustomer");

                //UpdateModel(user);
                //dbdata.SubmitChanges();
            }
            return RedirectToAction("TheCustomer");
        }
    }
}