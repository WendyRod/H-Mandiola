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
    public class ActividadController : Controller
    {
        private Entities db = new Entities();

        // GET: Actividad
        public async Task<ActionResult> IndexActividad()
        {
            var actividad = db.Database.SqlQuery<Actividad>("CONSULTA_ACTIVIDAD").ToList();
            return View(actividad);
        }

        // GET: Actividad/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Actividad actividad = await db.Actividad.FindAsync(id);
            if (actividad == null)
            {
                return HttpNotFound();
            }
            return View(actividad);
        }

        // GET: Actividad/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Actividad/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Actividad actividad)
        {
            if (ModelState.IsValid)
            {
                //db.Actividad.Add(actividad);
                //await db.SaveChangesAsync();
                db.INSERTA_ACTIVIDAD(actividad.Nombre, actividad.Descripcion);
                db.SaveChanges();
                return RedirectToAction("IndexActividad");
                
            }

            return View(actividad);
        }

        // GET: Actividad/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Actividad actividad = await db.Actividad.FindAsync(id);
            if (actividad == null)
            {
                return HttpNotFound();
            }
            return View(actividad);
        }

        // POST: Actividad/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Actividad actividad)
        {
            if (ModelState.IsValid)
            {
                db.Entry(actividad).State = System.Data.Entity.EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("IndexActividad");
            }
            return View(actividad);
        }

        // GET: Actividad/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Actividad actividad = await db.Actividad.FindAsync(id);
            if (actividad == null)
            {
                return HttpNotFound();
            }
            return View(actividad);
        }

        // POST: Actividad/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            Actividad actividad = await db.Actividad.FindAsync(id);
            db.Actividad.Remove(actividad);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexActividad");
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
