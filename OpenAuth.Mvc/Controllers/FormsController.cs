﻿using System;
using System.Web.Http;
using System.Web.Mvc;
using Infrastructure;
using OpenAuth.App;
using OpenAuth.App.Request;
using OpenAuth.Mvc.Models;
using OpenAuth.Repository.Domain;

namespace OpenAuth.Mvc.Controllers
{
    public class FormsController : BaseController
    {
        public FormApp App { get; set; }

        //
        [Authenticate]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Builder()
        {
            return View();
        }

        //添加或修改
        [System.Web.Mvc.HttpPost]
        public string Add(WFFrmMain obj)
        {
            try
            {
                App.Add(obj);

            }
            catch (Exception ex)
            {
                Result.Code = 500;
                Result.Message = ex.Message;
            }
            return JsonHelper.Instance.Serialize(Result);
        }

        //添加或修改
        [System.Web.Mvc.HttpPost]
        public string Update(WFFrmMain obj)
        {
            try
            {
                App.Update(obj);

            }
            catch (Exception ex)
            {
                Result.Code = 500;
                Result.Message = ex.Message;
            }
            return JsonHelper.Instance.Serialize(Result);
        }

        /// <summary>
        /// 加载列表
        /// </summary>
        public string Load([FromUri]QueryFormListReq request)
        {
            return JsonHelper.Instance.Serialize(App.Load(request));
        }

        [System.Web.Mvc.HttpPost]
        public string Delete(string[] ids)
        {
            try
            {
                App.Delete(ids);
            }
            catch (Exception e)
            {
                Result.Code = 500;
                Result.Message = e.Message;
            }

            return JsonHelper.Instance.Serialize(Result);
        }
    }
}