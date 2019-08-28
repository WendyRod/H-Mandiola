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
    public class ReservaController : Controller
    {
        private Entities db = new Entities();

        // GET: Reserva
        public async Task<ActionResult> Index()
        {
            var reserva = db.Reserva.Include(r => r.Usuario1);
            return View(await reserva.ToListAsync());
        }

        // GET: Reserva/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reserva reserva = await db.Reserva.FindAsync(id);
            if (reserva == null)
            {
                return HttpNotFound();
            }
            return View(reserva);
        }

        // GET: Reserva/Create
        public ActionResult Create()
        {
            ViewBag.Usuario = new SelectList(db.Usuario, "Codigo", "Nombre");
            return View();
        }

        // POST: Reserva/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Reserva res)
        {

            //var reserva = db.Database.SqlQuery<Reserva>("INSERTA_RESERVA");
            //var datos = db.Reserva.SqlQuery("[dbo].[INSERT_RESERVA]");
            

            if (ModelState.IsValid)
            {
                Usuario usuario = (Usuario)Session["name"];
                db.INSERTA_RESERVA(res.Fecha_Entrada, res.Fecha_Salida, res.Cantidad_Dias, res.Codigo_Promocional, res.Cantidad_Adultos, res.Cantidad_Niños, res.Mascota, res.Metodo_Pago, res.Precio, usuario.Nombre);
                db.SaveChanges();
                db.INSERTA_BITACORA("Agregar", "Se insertó una nueva reserva");
                return RedirectToAction("Index");
            }

            ViewBag.Usuario = new SelectList(db.Usuario, "Codigo", "Nombre", res.Usuario);
            return View(res);
        }

        // GET: Reserva/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reserva reserva = await db.Reserva.FindAsync(id);
            if (reserva == null)
            {
                return HttpNotFound();
            }
            ViewBag.Usuario = new SelectList(db.Usuario, "Codigo", "Nombre", reserva.Usuario);
            return View(reserva);
        }

        // POST: Reserva/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Reserva reserva)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reserva).State = System.Data.Entity.EntityState.Modified;
                await db.SaveChangesAsync();
                db.INSERTA_BITACORA("Modificar", "Se modificó una reserva");
                return RedirectToAction("Index");
            }
            ViewBag.Usuario = new SelectList(db.Usuario, "Codigo", "Nombre", reserva.Usuario);
            return View(reserva);
        }

        // GET: Reserva/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reserva reserva = await db.Reserva.FindAsync(id);
            if (reserva == null)
            {
                return HttpNotFound();
            }
            return View(reserva);
        }

        // POST: Reserva/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            Reserva reserva = await db.Reserva.FindAsync(id);
            db.Reserva.Remove(reserva);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
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
