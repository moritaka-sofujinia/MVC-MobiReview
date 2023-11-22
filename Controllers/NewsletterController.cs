using ReMoBi_DCSN.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReMoBi_DCSN.Controllers
{
    public class NewsletterController : Controller
    {
        private readonly dbDataContext dbdata;
        public NewsletterController()
        {
            var connectionString = "Data Source=MSIKHOI;Database=news1;Trusted_Connection=True";
            dbdata = new dbDataContext(connectionString);

            // table: newsletter
            // 1 column: email
        }
        // GET: Newsletter
        public ActionResult Index()
        {
            return View();
        }

        // GET: Newsletter/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Newsletter/Create
        public ActionResult Create()
        {       
            return View();
        }

        // POST: Newsletter/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult Create(string email)
        {
            try
            {
                // check if email exists in database
                var check = dbdata.newsletters.SingleOrDefault(n => n.email == email);
                if (check != null)
                {
                       // email exists
                    return RedirectToAction("Index", "ReMoBi");
                }
                else
                {
                    // email does not exist
                    newsletter n = new newsletter();
                    n.email = email;
                    dbdata.newsletters.InsertOnSubmit(n);
                    dbdata.SubmitChanges();
                    return RedirectToAction("Index", "ReMoBi");
                }
            }
            catch
            {
                return View();
            }
        }

        // GET: Newsletter/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Newsletter/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // check if email exists in database


                return RedirectToAction("Index", "ReMoBi");
            }
            catch
            {
                return View();
            }
        }

        // GET: Newsletter/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Newsletter/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
