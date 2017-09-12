using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using webApp.Models;
using Microsoft.Extensions.Configuration;

namespace webApp.Controllers
{
    public class HomeController : Controller
    {
        private IRepository repository;
        private string message;
        public HomeController(IRepository repo, IConfiguration config)
        {
            repository = repo;
            message = $"Essential Docker ({config["HOSTNAME"]})";
        }
        public IActionResult Index()
        {
            ViewBag.Message = message;
            return View(repository.Products);
        }

    }
}
