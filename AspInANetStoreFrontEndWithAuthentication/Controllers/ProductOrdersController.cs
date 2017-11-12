﻿using System;
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
    public class ProductOrdersController : Controller
    {
        private AspInANetStoreDatabaseEntities db = new AspInANetStoreDatabaseEntities();

        // GET: ProductOrders
        public ActionResult Index()
        {
            var productOrders = db.ProductOrders.Include(p => p.Order).Include(p => p.Product);
            return View(productOrders.ToList());
        }

        // GET: ProductOrders/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductOrder productOrder = db.ProductOrders.Find(id);
            if (productOrder == null)
            {
                return HttpNotFound();
            }
            return View(productOrder);
        }

        // GET: ProductOrders/Create
        public ActionResult Create()
        {
            ViewBag.OrderId = new SelectList(db.Orders, "Id", "Id");
            ViewBag.ProductId = new SelectList(db.Products, "Id", "ProductName");
            return View();
        }

        // POST: ProductOrders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,OrderId,ProductId,Quantity")] ProductOrder productOrder)
        {
            if (ModelState.IsValid)
            {
                db.ProductOrders.Add(productOrder);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OrderId = new SelectList(db.Orders, "Id", "Id", productOrder.OrderId);
            ViewBag.ProductId = new SelectList(db.Products, "Id", "ProductName", productOrder.ProductId);
            return View(productOrder);
        }

        // GET: ProductOrders/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductOrder productOrder = db.ProductOrders.Find(id);
            if (productOrder == null)
            {
                return HttpNotFound();
            }
            ViewBag.OrderId = new SelectList(db.Orders, "Id", "Id", productOrder.OrderId);
            ViewBag.ProductId = new SelectList(db.Products, "Id", "ProductName", productOrder.ProductId);
            return View(productOrder);
        }

        // POST: ProductOrders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,OrderId,ProductId,Quantity")] ProductOrder productOrder)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productOrder).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OrderId = new SelectList(db.Orders, "Id", "Id", productOrder.OrderId);
            ViewBag.ProductId = new SelectList(db.Products, "Id", "ProductName", productOrder.ProductId);
            return View(productOrder);
        }

        // GET: ProductOrders/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductOrder productOrder = db.ProductOrders.Find(id);
            if (productOrder == null)
            {
                return HttpNotFound();
            }
            return View(productOrder);
        }

        // POST: ProductOrders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductOrder productOrder = db.ProductOrders.Find(id);
            db.ProductOrders.Remove(productOrder);
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
