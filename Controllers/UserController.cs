using ReMoBi_DCSN.Models;
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
        private readonly dbDataContext db;
        public UserController()
        {
            var connectionString = "Data Source=MSIKHOI;Database=news1;Trusted_Connection=True";
            db = new dbDataContext(connectionString);
        }
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
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Login(FormCollection form)
        {
            var sTenDN = form["TaiKhoan"];
            var sMatKhau = form["MatKhau"];
            // var sMatKhau = GetMD5(f["MatKhau"]);

            var url = form["url"];
            if (string.IsNullOrEmpty(url))
                url = "~/ReMoBi/Index";

            if (String.IsNullOrEmpty(sTenDN))
            {
                ViewData["Err1"] = "Bạn chưa nhập tên đăng nhập!";
            }
            else if (String.IsNullOrEmpty(sMatKhau))
            {
                ViewData["Err2"] = "Mật khẩu không được để trống!";
            }
            else
            {

                KhachHang kh = db.KhachHangs.SingleOrDefault(n => n.username == sTenDN && n.password == sMatKhau);

                if (kh != null)
                {
                    ViewBag.ThongBao = "Bạn đã đăng nhập thành công.";
                    Session["TaiKhoan"] = kh;
                    //if (form["remember"].Contains("true"))
                    //{
                    //    // TenDN
                    //    Response.Cookies["TaiKhoan"].Value = sTenDN;
                    //    Response.Cookies["MatKhau"].Value = sMatKhau;
                    //    Response.Cookies["TaiKhoan"].Expires = DateTime.Now.AddDays(1);
                    //    Response.Cookies["MatKhau"].Expires = DateTime.Now.AddDays(1);
                    //}
                    //else
                    //{
                    //    Response.Cookies["TaiKhoan"].Expires = DateTime.Now.AddDays(-1);
                    //    Response.Cookies["MatKhau"].Expires = DateTime.Now.AddDays(-1);
                    //}
                    ////Session["tenND"] = kh.HoTen; 
                    ////return RedirectToAction("Index", "SachOnline");
                    //return Redirect(url);
                    return Redirect(url);
                }
                else
                {
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không không đúng!";
                }
            }
            return View();
        }

        // Get : Dang Xuat
        public ActionResult Logout()
        {
            Session["TaiKhoan"] = null;//remove session
            return RedirectToAction("Login", "Admin");
        }

        // Get: Đăng kí
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(FormCollection f, KhachHang kh)
        {
            // gán 
            var sHoTen = f["HoTen"];
            var sTaiKhoan = f["TaiKhoan"];
            var sMatKhau = f["MatKhau"];
            // var sMatKhau = GetMD5(f["MatKhau"]);
            var sMatKhauNhapLai = f["MatKhauNL"];
            var sDiaChi = f["DiaChi"];
            var sEmail = f["Email"];
            var sDienThoai = f["DienThoai"];
            var dNgaySinh = String.Format("{0:MM/dd/yyyy}", f["NgaySinh"]);

            if (db.KhachHangs.SingleOrDefault(n => n.username == sTaiKhoan) != null)
            {
                ViewBag.ThongBao = "Tên đăng nhập đã tồn tại";
            }
            else if (db.KhachHangs.SingleOrDefault(n => n.hovaten == sEmail) != null)
            {
                ViewBag.ThongBao = "Email đã được sử dụng";
            }

            else if (ModelState.IsValid)
            {
                kh.hovaten = sHoTen;
                kh.username = sTaiKhoan;
                kh.password = (sMatKhau);
                //kh.MatKhauNL = sMatKhauNhapLai;
                //kh.Email = sEmail;
                //kh.DiaChi = sDiaChi;
                //kh.DienThoai = sDienThoai;
                //kh.NgaySinh = DateTime.Parse(dNgaySinh);
                db.KhachHangs.InsertOnSubmit(kh);
                db.SubmitChanges();
                return Redirect("~/User/Login");
            }
            return View("Register");
        }
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
        public ActionResult ThongTinCN(string mkh)
        {
            var ttcn = from c in db.KhachHangs where c.hovaten == mkh select c;
            return View(ttcn);
        }
    }
}