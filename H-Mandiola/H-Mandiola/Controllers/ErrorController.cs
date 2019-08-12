using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using H_Mandiola.Models;

namespace H_Mandiola.Controllers
{
    public class ErrorController : Controller
    {
        private DataContext db = new DataContext();

        // GET: Error
        public async Task<ActionResult> IndexError()
        {
            var error = db.Database.SqlQuery<Error>("CONSULTA_ERROR").ToList();
            return View(error);
        }

        // GET: Error/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Error error = await db.Error.FindAsync(id);
            if (error == null)
            {
                return HttpNotFound();
            }
            return View(error);
        }

        // GET: Error/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Error/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Error error)
        {
            if (ModelState.IsValid)
            {
                db.Error.Add(error);
                await db.SaveChangesAsync();
                return RedirectToAction("IndexError");
            }

            return View(error);
        }

        // GET: Error/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Error error = await db.Error.FindAsync(id);
            if (error == null)
            {
                return HttpNotFound();
            }
            return View(error);
        }

        // POST: Error/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Error error)
        {
            if (ModelState.IsValid)
            {
                db.Entry(error).State = System.Data.Entity.EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("IndexError");
            }
            return View(error);
        }

        // GET: Error/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Error error = await db.Error.FindAsync(id);
            if (error == null)
            {
                return HttpNotFound();
            }
            return View(error);
        }

        // POST: Error/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Error error = await db.Error.FindAsync(id);
            db.Error.Remove(error);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexError");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
