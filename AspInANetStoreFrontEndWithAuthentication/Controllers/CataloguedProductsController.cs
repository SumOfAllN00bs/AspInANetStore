using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AspInANetStoreFrontEndWithAuthentication.Models;

namespace AspInANetStoreFrontEndWithAuthentication.Controllers
{
    public class CataloguedProductsController : Controller
    {
        private AspInANetStoreDatabaseEntities db = new AspInANetStoreDatabaseEntities();

        // GET: CataloguedProducts
        public ActionResult Index()
        {
            var cataloguedProducts = db.CataloguedProducts.Include(c => c.Catalogue).Include(c => c.Product);
            return View(cataloguedProducts.ToList());
        }

        // GET: CataloguedProducts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CataloguedProduct cataloguedProduct = db.CataloguedProducts.Find(id);
            if (cataloguedProduct == null)
            {
                return HttpNotFound();
            }
            return View(cataloguedProduct);
        }

        // GET: CataloguedProducts/Create
        public ActionResult Create()
        {
            ViewBag.CatalogueId = new SelectList(db.Catalogues, "Id", "Name");
            ViewBag.ProductId = new SelectList(db.Products, "Id", "ProductName");
            return View();
        }

        // POST: CataloguedProducts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,CatalogueId,ProductId")] CataloguedProduct cataloguedProduct)
        {
            if (ModelState.IsValid)
            {
                db.CataloguedProducts.Add(cataloguedProduct);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CatalogueId = new SelectList(db.Catalogues, "Id", "Name", cataloguedProduct.CatalogueId);
            ViewBag.ProductId = new SelectList(db.Products, "Id", "ProductName", cataloguedProduct.ProductId);
            return View(cataloguedProduct);
        }

        // GET: CataloguedProducts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CataloguedProduct cataloguedProduct = db.CataloguedProducts.Find(id);
            if (cataloguedProduct == null)
            {
                return HttpNotFound();
            }
            ViewBag.CatalogueId = new SelectList(db.Catalogues, "Id", "Name", cataloguedProduct.CatalogueId);
            ViewBag.ProductId = new SelectList(db.Products, "Id", "ProductName", cataloguedProduct.ProductId);
            return View(cataloguedProduct);
        }

        // POST: CataloguedProducts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CatalogueId,ProductId")] CataloguedProduct cataloguedProduct)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cataloguedProduct).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CatalogueId = new SelectList(db.Catalogues, "Id", "Name", cataloguedProduct.CatalogueId);
            ViewBag.ProductId = new SelectList(db.Products, "Id", "ProductName", cataloguedProduct.ProductId);
            return View(cataloguedProduct);
        }

        // GET: CataloguedProducts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CataloguedProduct cataloguedProduct = db.CataloguedProducts.Find(id);
            if (cataloguedProduct == null)
            {
                return HttpNotFound();
            }
            return View(cataloguedProduct);
        }

        // POST: CataloguedProducts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CataloguedProduct cataloguedProduct = db.CataloguedProducts.Find(id);
            db.CataloguedProducts.Remove(cataloguedProduct);
            db.SaveChanges();
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
