﻿//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a CodeSmith Template.
//
//     DO NOT MODIFY contents of this file. Changes to this
//     file will be lost if the code is regenerated.
//     Author:Yubao Li
// </autogenerated>
//------------------------------------------------------------------------------

using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using OpenAuth.Repository.Core;

namespace OpenAuth.Repository.Domain
{
    /// <summary>
	/// 功能模块表
	/// </summary>
      [Table("Module")]
    public partial class Module : TreeEntity
    {
        public Module()
        {
          this.CascadeId= string.Empty;
          this.Name= string.Empty;
          this.Url= string.Empty;
          this.HotKey= string.Empty;
          this.IconName= string.Empty;
          this.Status= 0;
          this.ParentName= string.Empty;
          this.Vector= string.Empty;
          this.SortNo= 0;
          this.ParentId= string.Empty;
          this.Code= string.Empty;
        }


        /// <summary>
	    /// 主页面URL
	    /// </summary>
         [Description("主页面URL")]
        public string Url { get; set; }
        /// <summary>
	    /// 热键
	    /// </summary>
         [Description("热键")]
        public string HotKey { get; set; }
        /// <summary>
	    /// 是否叶子节点
	    /// </summary>
         [Description("是否叶子节点")]
        public bool IsLeaf { get; set; }
        /// <summary>
	    /// 是否自动展开
	    /// </summary>
         [Description("是否自动展开")]
        public bool IsAutoExpand { get; set; }
        /// <summary>
	    /// 节点图标文件名称
	    /// </summary>
         [Description("节点图标文件名称")]
        public string IconName { get; set; }
        /// <summary>
        /// 当前状态，0：正常，-1：隐藏，不在导航列表中显示
        /// </summary>
        [Description("当前状态")]
        public int Status { get; set; }
      
        /// <summary>
	    /// 矢量图标
	    /// </summary>
         [Description("矢量图标")]
        public string Vector { get; set; }
        /// <summary>
	    /// 排序号
	    /// </summary>
         [Description("排序号")]
        public int SortNo { get; set; }

        /// <summary>
	    /// 模块标识
	    /// </summary>
         [Description("模块标识")]
        public string Code { get; set; }

        /// <summary>
        /// 是否系统模块
        /// </summary>
        [Description("是否系统模块")]
        public bool IsSys { get; set; }
        
        /// <summary>
        /// 前端界面是否缓存
        /// </summary>
        /// [Description("前端界面是否缓存")]
        public bool Keepalive { get; set; }

    }
}