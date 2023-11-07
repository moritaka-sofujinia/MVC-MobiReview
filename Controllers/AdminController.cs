using ReMoBi_DCSN.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
    }
}