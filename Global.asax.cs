using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace ReMoBi_DCSN
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);


            // Đọc giá trị hit counter từ file hoặc khởi tạo nếu file không tồn tại
            string filePath = HttpContext.Current.Server.MapPath("~/OnlineAccess.txt");
            int hitCounter = 0;
            if (System.IO.File.Exists(filePath))
            {
                string fileContent = System.IO.File.ReadAllText(filePath);
                int.TryParse(fileContent, out hitCounter);
            }

            Application["HitCounter"] = hitCounter;
            Application["OnlineUsers"] = 0;
        }


        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Application["OnlineUsers"] = (int)Application["OnlineUsers"] + 1;
            Application["HitCounter"] = (int)Application["HitCounter"] + 1;
            Application.UnLock();

            // Ghi giá trị hit counter vào file OnlineAccess.txt
            System.IO.File.WriteAllText(HttpContext.Current.Server.MapPath("~/OnlineAccess.txt"), Application["HitCounter"].ToString());
        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["OnlineUsers"] = (int)Application["OnlineUsers"] - 1;
            Application.UnLock();
        }
    }
}
