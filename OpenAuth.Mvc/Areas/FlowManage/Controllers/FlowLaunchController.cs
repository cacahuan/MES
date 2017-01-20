﻿using System;
using System.Web.Mvc;
using Infrastructure;
using OpenAuth.App;
using OpenAuth.Domain;
using OpenAuth.Mvc;

namespace LeaRun.Application.Web.Areas.FlowManage.Controllers
{
    /// <summary>
    /// 版 本 6.1
    /// Copyright (c) 2013-2016 上海力软信息技术有限公司
    /// 创建人：陈彬彬
    /// 日 期：2016.03.19 14:27
    /// 描 述：流程发起
    /// </summary>
    public class FlowLaunchController : Controller
    {
        private WFRuntimeService wfProcessBll;

        public FlowLaunchController()
        {
            wfProcessBll = AutofacExt.GetFromFac<WFRuntimeService>();
        }
        #region 视图功能
        //
        // GET: /FlowManage/FlowLaunch/
        /// <summary>
        /// 管理
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 预览
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult PreviewIndex()
        {
            return View();
        }
        /// <summary>
        /// 创建流程实例
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult FlowProcessNewForm()
        {
            return View();
        }
        #endregion

        #region 提交数据
        /// <summary>
        /// 创建流程实例
        /// </summary>
        /// <param name="wfSchemeInfoId">流程模板信息Id</param>
        /// <param name="frmData">表单数据</param>
        /// <param name="type">0发起，3草稿</param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateProcess(Guid wfSchemeInfoId, string wfProcessInstanceJson, string frmData)
        {
            WFProcessInstance wfProcessInstanceEntity = wfProcessInstanceJson.ToObject<WFProcessInstance>();
            string text = "创建成功";
            if (wfProcessInstanceEntity.EnabledMark == 1)//发起流程
            {
                wfProcessBll.CreateInstance(Guid.NewGuid(), wfSchemeInfoId, wfProcessInstanceEntity, frmData);
            }
            else if (wfProcessInstanceEntity.EnabledMark == 3)//草稿
            {
                wfProcessBll.CreateRoughdraft(Guid.NewGuid(), wfSchemeInfoId, wfProcessInstanceEntity, frmData);
                text = "草稿保存成功";
            }

            return Content(text);
        } 
        #endregion
    }
}