using PagedList;
using ReMoBi_DCSN.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;

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

        [HttpGet]
        public ActionResult AddnewPost() 
        {
            ViewBag.TagID = new SelectList(dbdata.tags.ToList().OrderBy(n => n.Name_Tags), "TagID", "Name_Tags");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddnewPost(Post post, HttpPostedFileBase file)
        
        {
            if(file == null)
            {
                ViewBag.thongbao = "Vui long chon anh bia cho bai viet";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var filename = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/images/Slider/"), filename);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.ThongBao = "Hinh anh da ton tai !";

                    }
                    else
                    {
                        file.SaveAs(path);
                    }
                    post.AnhBia = filename;
                    dbdata.Posts.InsertOnSubmit(post);
                    dbdata.SubmitChanges();
                }
            }
            return RedirectToAction("Post");
        }
    }
}