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
    public class PrecioController : Controller
    {
        private Entities db = new Entities();

        // GET: Precio
        public async Task<ActionResult> IndexPrecio()
        {
            var precio = db.Database.SqlQuery<Precio>("CONSULTA_PRECIO").ToList();
            return View(precio);
        }

        // GET: Precio/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Precio precio = await db.Precio.FindAsync(id);
            if (precio == null)
            {
                return HttpNotFound();
            }
            return View(precio);
        }

        // GET: Precio/Create
        public ActionResult Create()
        {
            // ViewBag.Tipo_Habitacion = new SelectList(db.Precio, "Codigo", "Tipo");
            return View();
        }

        // POST: Precio/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Precio precio)
        {
            if (ModelState.IsValid)
            {
                db.Precio.Add(precio);
                await db.SaveChangesAsync();
                db.INSERTA_BITACORA("Agregar", "Se insertó un nuevo precio");
                return RedirectToAction("IndexPrecio");
            }

            //ViewBag.Tipo_Habitacion = new SelectList(db.Tipo_Habitacion, "Codigo", "Tipo", precio.Tipo_Habitacion);
            return View(precio);
        }

        // GET: Precio/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Precio precio = await db.Precio.FindAsync(id);
            if (precio == null)
            {
                return HttpNotFound();
            }
            //ViewBag.Tipo_Habitacion = new SelectList(db.Tipo_Habitacion, "Codigo", "Tipo", precio.Tipo_Habitacion);
            return View(precio);
        }

        // POST: Precio/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Precio precio)
        {
            if (ModelState.IsValid)
            {
                db.Entry(precio).State = System.Data.Entity.EntityState.Modified;
                await db.SaveChangesAsync();
                db.INSERTA_BITACORA("Modificar", "Se modificó un precio");
                return RedirectToAction("IndexPrecio");
            }
            //ViewBag.Tipo_Habitacion = new SelectList(db.Tipo_Habitacion, "Codigo", "Tipo", precio.Tipo_Habitacion);
            return View(precio);
        }

        // GET: Precio/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Precio precio = await db.Precio.FindAsync(id);
            if (precio == null)
            {
                return HttpNotFound();
            }
            return View(precio);
        }

        // POST: Precio/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            Precio precio = await db.Precio.FindAsync(id);
            db.Precio.Remove(precio);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexPrecio");
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
