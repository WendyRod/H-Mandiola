using System;
using System.Collections.Generic;
using System.Data;
//using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using H_Mandiola.Models;

namespace H_Mandiola
{
    public class usuariosController : Controller
    {
        #region ClaseReferencia


        //        private Entities db = new Entities();

        //        // GET: usuarios
        //        public ActionResult Index()
        //        {
        //            var usuario = db.usuario.Include(u => u.consecutivo).Include(u => u.estado).Include(u => u.rol);
        //            return View(usuario.ToList());
        //        }

        //        // GET: usuarios/Details/5
        //        public ActionResult Details(decimal id)
        //        {
        //            if (id == null)
        //            {
        //                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //            }
        //            usuario usuario = db.usuario.Find(id);
        //            if (usuario == null)
        //            {
        //                return HttpNotFound();
        //            }
        //            return View(usuario);
        //        }

        //        // GET: usuarios/Create
        //        public ActionResult Create()
        //        {
        //            ViewBag.consecutivo_codigo = new SelectList(db.consecutivo, "codigo", "descripcion");
        //            ViewBag.estado_codigo = new SelectList(db.estado, "codigo", "tipo");
        //            ViewBag.rol_codigo = new SelectList(db.rol, "codigo", "tipo");
        //            return View();
        //        }

        //        // POST: usuarios/Create
        //        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //        [HttpPost]
        //        [ValidateAntiForgeryToken]
        //        public ActionResult Create([Bind(Include = "cedula,nombre,apellido1,apellido2,email,usuario1,clave,pregunta,respuesta,rol_codigo,estado_codigo,consecutivo_codigo")] usuario usuario)
        //        {
        //            if (ModelState.IsValid)
        //            {
        //                db.usuario.Add(usuario);
        //                //db.USUARIO_REGISTRO(usuario.cedula,);
        //                db.SaveChanges();
        //                return RedirectToAction("Index");
        //            }

        //            ViewBag.consecutivo_codigo = new SelectList(db.consecutivo, "codigo", "descripcion", usuario.consecutivo_codigo);
        //            ViewBag.estado_codigo = new SelectList(db.estado, "codigo", "tipo", usuario.estado_codigo);
        //            ViewBag.rol_codigo = new SelectList(db.rol, "codigo", "tipo", usuario.rol_codigo);
        //            return View(usuario);
        //        }

        //        /*public ActionResult asd( perro, gato, conejo) {

        //        }*/

        //        // GET: usuarios/Edit/5
        //        public ActionResult Edit(decimal id)
        //        {
        //            if (id == null)
        //            {
        //                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //            }
        //            usuario usuario = db.usuario.Find(id);
        //            if (usuario == null)
        //            {
        //                return HttpNotFound();
        //            }
        //            ViewBag.consecutivo_codigo = new SelectList(db.consecutivo, "codigo", "descripcion", usuario.consecutivo_codigo);
        //            ViewBag.estado_codigo = new SelectList(db.estado, "codigo", "tipo", usuario.estado_codigo);
        //            ViewBag.rol_codigo = new SelectList(db.rol, "codigo", "tipo", usuario.rol_codigo);
        //            return View(usuario);
        //        }

        //        // POST: usuarios/Edit/5
        //        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //        [HttpPost]
        //        [ValidateAntiForgeryToken]
        //        public ActionResult Edit([Bind(Include = "cedula,nombre,apellido1,apellido2,email,usuario1,clave,pregunta,respuesta,rol_codigo,estado_codigo,consecutivo_codigo")] usuario usuario)
        //        {
        //            if (ModelState.IsValid)
        //            {
        //                db.Entry(usuario).State = EntityState.Modified;
        //                db.SaveChanges();
        //                return RedirectToAction("Index");
        //            }
        //            ViewBag.consecutivo_codigo = new SelectList(db.consecutivo, "codigo", "descripcion", usuario.consecutivo_codigo);
        //            ViewBag.estado_codigo = new SelectList(db.estado, "codigo", "tipo", usuario.estado_codigo);
        //            ViewBag.rol_codigo = new SelectList(db.rol, "codigo", "tipo", usuario.rol_codigo);
        //            return View(usuario);
        //        }

        //        // GET: usuarios/Delete/5
        //        public ActionResult Delete(decimal id)
        //        {
        //            if (id == null)
        //            {
        //                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //            }
        //            usuario usuario = db.usuario.Find(id);
        //            if (usuario == null)
        //            {
        //                return HttpNotFound();
        //            }
        //            return View(usuario);
        //        }

        //        // POST: usuarios/Delete/5
        //        [HttpPost, ActionName("Delete")]
        //        [ValidateAntiForgeryToken]
        //        public ActionResult DeleteConfirmed(decimal id)
        //        {
        //            usuario usuario = db.usuario.Find(id);
        //            db.usuario.Remove(usuario);
        //            db.SaveChanges();
        //            return RedirectToAction("Index");
        //        }

        //        protected override void Dispose(bool disposing)
        //        {
        //            if (disposing)
        //            {
        //                db.Dispose();
        //            }
        //            base.Dispose(disposing);
        //        }
        #endregion
    }
}
