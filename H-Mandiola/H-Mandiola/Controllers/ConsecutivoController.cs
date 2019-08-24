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
    public class ConsecutivoController : Controller
    {
        private DataContext db = new DataContext();

        // GET: Consecutivo
        public async Task<ActionResult> IndexConsecutivo()
        {
            return View(await db.Consecutivo.ToListAsync());
        }

        // GET: Consecutivo/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consecutivo consecutivo = await db.Consecutivo.FindAsync(id);
            if (consecutivo == null)
            {
                return HttpNotFound();
            }
            return View(consecutivo);
        }

        // GET: Consecutivo/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Consecutivo/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Consecutivo consecutivo)
        {
            if (ModelState.IsValid)
            {
                db.Consecutivo.Add(consecutivo);
                await db.SaveChangesAsync();
                return RedirectToAction("IndexConsecutivo");
            }

            return View(consecutivo);
        }

        // GET: Consecutivo/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consecutivo consecutivo = await db.Consecutivo.FindAsync(id);
            if (consecutivo == null)
            {
                return HttpNotFound();
            }
            return View(consecutivo);
        }

        // POST: Consecutivo/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Consecutivo consecutivo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(consecutivo).State = System.Data.Entity.EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("IndexConsecutivo");
            }
            return View(consecutivo);
        }

        // GET: Consecutivo/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consecutivo consecutivo = await db.Consecutivo.FindAsync(id);
            if (consecutivo == null)
            {
                return HttpNotFound();
            }
            return View(consecutivo);
        }

        // POST: Consecutivo/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Consecutivo consecutivo = await db.Consecutivo.FindAsync(id);
            db.Consecutivo.Remove(consecutivo);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexConsecutivo");
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
