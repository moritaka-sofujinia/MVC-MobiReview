using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace ReMoBi_DCSN.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return RedirectToAction("Login");
        }
        // GET: DangNhap
        [HttpGet]
        public ActionResult Login(string url)
        {
            ViewBag.url = url;
            return View();
        }
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Login(FormCollection f)
        //{
        //var sTenDN = f["TaiKhoan"];
        //var sMatKhau = f["MatKhau"];
        //// var sMatKhau = GetMD5(f["MatKhau"]);

        //var url = f["url"];
        //if (string.IsNullOrEmpty(url))
        //    url = "~/ReMoi/Index";

        //if (String.IsNullOrEmpty(sTenDN))
        //{
        //    ViewData["Err1"] = "Bạn chưa nhập tên đăng nhập!";
        //}
        //else if (String.IsNullOrEmpty(sMatKhau))
        //{
        //    ViewData["Err2"] = "Mật khẩu không được để trống!";
        //}
        //else
        //{
        //    var hashedPassword = HashPassword(sMatKhau);
        //    KHACHHANG kh = db.KHACHHANGs.SingleOrDefault(n => n.TaiKhoan == sTenDN && n.MatKhau == hashedPassword);
        //    if (kh != null)
        //    {
        //        ViewBag.ThongBao = "Bạn đã đăng nhập thành công.";
        //        Session["TaiKhoan"] = kh;
        //        if (f["remember"].Contains("true"))
        //        {
        //            // TenDN
        //            Response.Cookies["TaiKhoan"].Value = sTenDN;
        //            Response.Cookies["MatKhau"].Value = sMatKhau;
        //            Response.Cookies["TaiKhoan"].Expires = DateTime.Now.AddDays(1);
        //            Response.Cookies["MatKhau"].Expires = DateTime.Now.AddDays(1);
        //        }
        //        else
        //        {
        //            Response.Cookies["TaiKhoan"].Expires = DateTime.Now.AddDays(-1);
        //            Response.Cookies["MatKhau"].Expires = DateTime.Now.AddDays(-1);
        //        }
        //        //Session["tenND"] = kh.HoTen; 
        //        //return RedirectToAction("Index", "SachOnline");
        //        return Redirect(url);
        //    }
        //    else
        //    {
        //        ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không không đúng!";
        //    }
        //}
        //return View();
        //}

        // Get : Dang Xuat
        public ActionResult Logout()
        {
            Session["TaiKhoan"] = null;//remove session
            return RedirectToAction("Index", "ReMobi");
        }

        // Get: Đăng kí
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        //[HttpPost]
        //public ActionResult Register(FormCollection f/*, KHACHHANG kh*/)
        //{
        //    // gán 
        //    var sHoTen = f["HoTen"];
        //    var sTaiKhoan = f["TaiKhoan"];
        //    var sMatKhau = f["MatKhau"];
        //    // var sMatKhau = GetMD5(f["MatKhau"]);
        //    var sMatKhauNhapLai = f["MatKhauNL"];
        //    var sDiaChi = f["DiaChi"];
        //    var sEmail = f["Email"];
        //    var sDienThoai = f["DienThoai"];
        //    var dNgaySinh = String.Format("{0:MM/dd/yyyy}", f["NgaySinh"]);

        //    if (db.KHACHHANGs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan) != null)
        //    {
        //        ViewBag.ThongBao = "Tên đăng nhập đã tồn tại";
        //    }
        //    else if (db.KHACHHANGs.SingleOrDefault(n => n.Email == sEmail) != null)
        //    {
        //        ViewBag.ThongBao = "Email đã được sử dụng";
        //    }

        //    else if (ModelState.IsValid)
        //    {
        //        kh.HoTen = sHoTen;
        //        kh.TaiKhoan = sTaiKhoan;
        //        kh.MatKhau = HashPassword(sMatKhau);
        //        //kh.MatKhauNL = sMatKhauNhapLai;
        //        kh.Email = sEmail;
        //        kh.DiaChi = sDiaChi;
        //        kh.DienThoai = sDienThoai;
        //        kh.NgaySinh = DateTime.Parse(dNgaySinh);
        //        db.KHACHHANGs.InsertOnSubmit(kh);
        //        db.SubmitChanges();
        //        return Redirect("~/User/DangNhap");
        //    }
        //    return View("Register");
        //}
        //public static string HashPassword(string password)
        //{
        //    using (SHA256 sha256 = SHA256.Create())
        //    {
        //        byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
        //        StringBuilder builder = new StringBuilder();
        //        for (int i = 0; i < bytes.Length; i++)
        //        {
        //            builder.Append(bytes[i].ToString("x2"));
        //        }
        //        return builder.ToString().Substring(0, 15); // Giới hạn độ dài mật khẩu
        //    }
        //}

    }
}