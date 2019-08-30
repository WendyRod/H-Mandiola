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
using System.Data.SqlClient;


namespace H_Mandiola.Controllers
{
    public class BitacoraController : Controller
    {
        private Entities1 db = new Entities1();

        // GET: Bitacora
        public async Task<ActionResult> IndexBitacora()
        {
            var bitacora = db.Database.SqlQuery<Bitacora>("CONSULTA_BITACORA").ToList();
            return View(bitacora);
        }

        // GET: Bitacora/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bitacora bitacora = await db.Bitacora.FindAsync(id);
            if (bitacora == null)
            {
                return HttpNotFound();
            }
            return View(bitacora);
        }

        // GET: Bitacora/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Bitacora/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Bitacora bitacora)
        {
            if (ModelState.IsValid)
            {
                db.Bitacora.Add(bitacora);
                await db.SaveChangesAsync();
                return RedirectToAction("IndexBitacora");
            }

            return View(bitacora);
        }

        // GET: Bitacora/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bitacora bitacora = await db.Bitacora.FindAsync(id);
            if (bitacora == null)
            {
                return HttpNotFound();
            }
            return View(bitacora);
        }

        // POST: Bitacora/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Bitacora bitacora)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bitacora).State = System.Data.Entity.EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("IndexBitacora");
            }
            return View(bitacora);
        }

        // GET: Bitacora/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bitacora bitacora = await db.Bitacora.FindAsync(id);
            if (bitacora == null)
            {
                return HttpNotFound();
            }
            return View(bitacora);
        }

        // POST: Bitacora/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            Bitacora bitacora = await db.Bitacora.FindAsync(id);
            db.Bitacora.Remove(bitacora);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexBitacora");
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
