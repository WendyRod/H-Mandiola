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
    public class HabitacionController : Controller
    {
        private Entities db = new Entities();

        // GET: Habitacion
        public async Task<ActionResult> IndexHabitacion()
        {
            var habitacion = db.Database.SqlQuery<Habitacion>("CONSULTA_HABITACION").ToList();
            //var habitacion = db.Habitacion.Include(h => h.Est_Hab1).Include(h => h.Precio1);
            return View(habitacion);
        }

        public async Task<ActionResult> IndexConsultaHabitacion()
        {
            var habitacion = db.Database.SqlQuery<Habitacion>("CONSULTA_HABITACION").ToList();
            //var habitacion = db.Habitacion.Include(h => h.Est_Hab1).Include(h => h.Precio1);
            return View(habitacion);
        }

        // GET: Habitacion/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Habitacion habitacion = await db.Habitacion.FindAsync(id);
            if (habitacion == null)
            {
                return HttpNotFound();
            }
            return View(habitacion);
        }

        // GET: Habitacion/Create
        public ActionResult Create()
        {
            ViewBag.Est_Hab = new SelectList(db.Est_Hab, "Codigo", "Descripcion");
            ViewBag.Precio = new SelectList(db.Precio, "Codigo", "Codigo");
            return View();
        }

        // POST: Habitacion/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Habitacion habitacion)
        {
            if (ModelState.IsValid)
            {
                db.INSERTA_HABITACION(habitacion.Numero,habitacion.Descripcion,habitacion.Est_Hab, habitacion.Precio);
                db.SaveChanges();
                db.INSERTA_BITACORA("Agregar", "Se insertó una nueva habitación");
            }

            ViewBag.Est_Hab = new SelectList(db.Est_Hab, "Codigo", "Descripcion", habitacion.Est_Hab);
            ViewBag.Precio = new SelectList(db.Precio, "Codigo", "Codigo", habitacion.Precio);
            return View(habitacion);
        }

        // GET: Habitacion/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Habitacion habitacion = await db.Habitacion.FindAsync(id);
            if (habitacion == null)
            {
                return HttpNotFound();
            }
            ViewBag.Est_Hab = new SelectList(db.Est_Hab, "Codigo", "Descripcion", habitacion.Est_Hab);
            ViewBag.Precio = new SelectList(db.Precio, "Codigo", "Codigo", habitacion.Precio);
            return View(habitacion);
        }

        // POST: Habitacion/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Habitacion habitacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(habitacion).State = System.Data.Entity.EntityState.Modified;
                await db.SaveChangesAsync();
                db.INSERTA_BITACORA("Modificar", "Se modificó una habitación");
                return RedirectToAction("IndexHabitacion");
            }
            ViewBag.Est_Hab = new SelectList(db.Est_Hab, "Codigo", "Descripcion", habitacion.Est_Hab);
            ViewBag.Precio = new SelectList(db.Precio, "Codigo", "Codigo", habitacion.Precio);
            return View(habitacion);
        }

        // GET: Habitacion/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Habitacion habitacion = await db.Habitacion.FindAsync(id);
            if (habitacion == null)
            {
                return HttpNotFound();
            }
            return View(habitacion);
        }

        // POST: Habitacion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            Habitacion habitacion = await db.Habitacion.FindAsync(id);
            db.Habitacion.Remove(habitacion);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexHabitacion");
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
